; DESCRIPTION: This assembly code initializes a virtual environment with a map containing a hypervisor building. It handles player movement, rendering of the terrain and building, proximity checks, and creates a window when the player enters the building to simulate booting a Linux system using a hypervisor. The code manages memory for configuration strings, window titles, player position, and flags, and uses WINSYS and HYPERVISOR instructions to create and configure the virtual environment.

; linux_building.asm -- Hypervisor Building Demo (Phase 86)
; Demonstrates: player sees hypervisor building on map, enters it,
; a WINSYS window opens and HYPERVISOR is configured to target it.
; In a real scenario, Linux would boot inside the window.
; This demo creates the window and configures the hypervisor.
;
; Memory layout:
;   0x2000  - hypervisor config string "arch=riscv64 kernel=Image ram=256M"
;   0x2100  - window title "Linux Terminal"
;   0x7500  - building table (single hypervisor building)
;   0x7580  - building count
;   0x7800  - camera_x
;   0x7801  - camera_y
;   0x7808  - player_x
;   0x7809  - player_y
;   0x780A  - facing
;   0x780B  - walk_frame
;   0x7588  - nearby_flag
;   0x7584  - nearby_bldg_ptr

; ===== Constants =====
LDI r10, 1
LDI r11, 64
LDI r9, 4              ; tile size
LDI r5, 0xFFB          ; key bitmask port
LDI r4, 0x7FFE        ; frame_counter (TICKS)
LDI r8, 0             ; player_x (will init)
LDI r0, 0             ; player_y (will init)

; ===== Initialize Config String at 0x2000 =====
LDI r20, 0x2000
STRO r20, "arch=riscv64 kernel=Image ram=256M"

; ===== Initialize Window Title at 0x2100 =====
LDI r20, 0x2100
STRO r20, "Linux Terminal"

; ===== Initialize Building Table =====
; Single building: hypervisor (gold)
LDI r20, 0x7500
LDI r17, 32            ; world_x
STORE r20, r17
ADDI r20, 1
LDI r17, 32            ; world_y
STORE r20, r17
ADDI r20, 1
LDI r17, 0xFFD700      ; gold color
STORE r20, r17
ADDI r20, 1
LDI r20, 0x7600        ; name addr
LDI r17, 0x7600
STORE r20, r17

; Building name
LDI r20, 0x7600
STRO r20, "linux"

; Building count
LDI r17, 0x7580
LDI r18, 1
STORE r17, r18

; Player position
LDI r17, 0x7808
LDI r18, 30
STORE r17, r18         ; player_x = 30
LDI r17, 0x7809
LDI r18, 32
STORE r17, r18         ; player_y = 32
LDI r17, 0x780A
LDI r18, 0
STORE r17, r18         ; facing = 0
LDI r17, 0x780B
STORE r17, r18         ; walk_frame = 0

; Camera
LDI r17, 0x7800
LDI r18, 0
STORE r17, r18         ; camera_x = 0
LDI r17, 0x7801
STORE r17, r18         ; camera_y = 0

; Flags
LDI r17, 0x7584
STORE r17, r18         ; nearby_bldg_ptr = 0
LDI r17, 0x7588
STORE r17, r18         ; nearby_flag = 0

; Window ID storage (0 = no window yet)
LDI r17, 0x7810
STORE r17, r18         ; window_id = 0

; ===== Main Loop =====
main_loop:

; Increment frame counter
LOAD r17, r4
ADD r17, r10
STORE r4, r17

; --- Read key bitmask ---
LOAD r16, r5

; --- Process movement ---
; Throttle to ~7.5 moves/sec
LDI r17, 7
LOAD r18, r4
AND r18, r17
JNZ r18, skip_move

; Up (bit 0)
MOV r17, r16
LDI r18, 1
AND r17, r18
JZ r17, no_up
LDI r17, 0x780A
LDI r18, 0
STORE r17, r18
LDI r17, 0x7809
LOAD r18, r17
SUB r18, r10
STORE r17, r18
no_up:

; Down (bit 1)
MOV r17, r16
LDI r18, 2
AND r17, r18
JZ r17, no_down
LDI r17, 0x780A
LDI r18, 1
STORE r17, r18
LDI r17, 0x7809
LOAD r18, r17
ADD r18, r10
STORE r17, r18
no_down:

; Left (bit 2)
MOV r17, r16
LDI r18, 4
AND r17, r18
JZ r17, no_left
LDI r17, 0x780A
LDI r18, 2
STORE r17, r18
LDI r17, 0x7808
LOAD r18, r17
SUB r18, r10
STORE r17, r18
no_left:

; Right (bit 3)
MOV r17, r16
LDI r18, 8
AND r17, r18
JZ r17, no_right
LDI r17, 0x780A
LDI r18, 3
STORE r17, r18
LDI r17, 0x7808
LOAD r18, r17
ADD r18, r10
STORE r17, r18
no_right:

skip_move:

; --- Re-read player position ---
LDI r18, 0x7808
LOAD r8, r18
LDI r18, 0x7809
LOAD r0, r18

; --- Compute camera ---
LDI r17, 32
MOV r18, r8
SUB r18, r17
LDI r17, 0x7800
STORE r17, r18
LDI r17, 32
MOV r18, r0
SUB r18, r17
LDI r17, 0x7801
STORE r17, r18

; ===== Render Scene =====
FILL r15                ; clear screen to black

; --- Draw terrain (simple gradient) ---
LDI r5, 0
LDI r2, 0
LDI r13, 0x1A3A1A     ; dark green
y_loop:
  LDI r2, 0
  x_loop:
    PSET r2, r5, r13
    ADD r2, r10
    LDI r17, 256
    CMP r2, r17
    BLT r15, x_loop
  ADD r5, r10
  LDI r17, 256
  CMP r5, r17
  BLT r15, y_loop

; --- Draw Building ---
PUSH r31
LDI r20, 0x7500
LDI r17, 0x7580
LOAD r21, r17
LDI r17, 0

bldg_loop:
  MOV r22, r20
  LOAD r14, r22         ; bldg world_x
  ADDI r22, 1
  LOAD r12, r22         ; bldg world_y
  ADDI r22, 1
  LOAD r25, r22        ; type_color
  ADDI r22, 1

  ; Screen coords
  LDI r18, 0x7800
  LOAD r27, r18
  MOV r28, r14
  SUB r28, r27
  LDI r18, 4
  MUL r28, r18         ; screen_x

  LDI r18, 0x7801
  LOAD r27, r18
  MOV r29, r12
  SUB r29, r27
  LDI r18, 4
  MUL r29, r18         ; screen_y

  ; Building body 24x32
  LDI r18, 24
  LDI r19, 32
  RECTF r28, r29, r18, r19, r25

  ; Door 4x8
  MOV r22, r28
  ADDI r22, 10
  MOV r23, r29
  ADDI r23, 24
  LDI r18, 4
  LDI r19, 8
  LDI r17, 0x222222
  RECTF r22, r23, r18, r19, r17

  ; Windows
  MOV r22, r28
  ADDI r22, 3
  MOV r23, r29
  ADDI r23, 4
  LDI r18, 4
  LDI r19, 4
  LDI r17, 0x88CCFF
  RECTF r22, r23, r18, r19, r17
  MOV r22, r28
  ADDI r22, 17
  RECTF r22, r23, r18, r19, r17

  ; Building name
  MOV r22, r28
  ADDI r22, 2
  MOV r23, r29
  ADDI r23, 20
  LDI r26, 0x7600
  TEXT r22, r23, r26

  ; Proximity check
  LDI r18, 0x7808
  LOAD r27, r18
  LDI r18, 0x7809
  LOAD r18, r18
  MOV r22, r14
  ADDI r22, 3
  MOV r23, r27
  SUB r23, r22
  LDI r24, 31
  SAR r23, r24
  JZ r23, dx_ok
  MOV r23, r22
  SUB r23, r27
  JMP dx_abs
dx_ok:
  MOV r23, r27
  SUB r23, r22
dx_abs:
  LDI r24, 5
  CMP r23, r24
  BGE r15, bldg_next

  MOV r22, r12
  ADDI r22, 4
  MOV r23, r18
  SUB r23, r22
  LDI r24, 31
  SAR r23, r24
  JZ r23, dy_ok
  MOV r23, r22
  SUB r23, r18
  JMP dy_abs
dy_ok:
  MOV r23, r18
  SUB r23, r22
dy_abs:
  LDI r24, 5
  CMP r23, r24
  BGE r15, bldg_next

  ; Nearby
  LDI r17, 1
  LDI r18, 0x7588
  STORE r18, r17

bldg_next:
  ADDI r20, 4
  ADDI r17, 1
  MOV r22, r17
  CMP r22, r21
  BLT r15, bldg_loop
POP r31

; --- Draw Player (blue square at center) ---
PSETI 128, 126, 0x4444FF
PSETI 129, 126, 0x4444FF
PSETI 127, 126, 0x4444FF
PSETI 128, 127, 0x4444FF
PSETI 128, 125, 0x4444FF

; --- Show Tooltip if nearby ---
LDI r17, 0x7588
LOAD r17, r17
JZ r17, no_tooltip

; "[E] Enter Linux" tooltip
LDI r18, 100
LDI r19, 112
LDI r20, 0x5030
STRO r20, "[E] Enter Linux"
LDI r21, 0xFFFF88
LDI r17, 0x1A1A2E
DRAWTEXT r18, r19, r20, r21, r17

no_tooltip:

; --- Check if Enter pressed (bit 5) and nearby ---
LDI r17, 0x7588
LOAD r17, r17
JZ r17, no_enter

MOV r17, r16
LDI r18, 32            ; bit 5 = Enter
AND r17, r18
JZ r17, no_enter

; Enter building! Create a WINSYS window and start hypervisor
LDI r17, 0x7810
LOAD r18, r17
JNZ r18, already_open  ; window already created

; WINSYS op=0: create window (r1=x, r3=y, r14=w, r12=h, r7=title_addr)
LDI r17, 0x94
LDI r18, 1             ; op_reg = r1, set r1=0 (op=0=create)
LDI r1, 0              ; op = 0 (create)
LDI r3, 16             ; x = 16
LDI r14, 16             ; y = 16
LDI r12, 200            ; w = 200
LDI r7, 150            ; h = 150
LDI r6, 0x2100         ; title_addr = "Linux Terminal"
STORE r6, r6           ; ensure title exists

; Call WINSYS via inline bytecode simulation
; We need to use the opcode directly -- use a RAM-based approach
; Write the WINSYS create instruction to RAM and execute it
LDI r5, 0x3000
LDI r2, 0x94          ; WINSYS opcode
STORE r5, r2
ADDI r5, 1
LDI r2, 1             ; op_reg = r1
STORE r5, r2
LDI r5, 0x3000
CALL do_winsys_create
JMP after_create

do_winsys_create:
  ; Set up registers for WINSYS create
  LDI r1, 0             ; op = 0 (create)
  LDI r3, 16            ; x
  LDI r14, 16            ; y
  LDI r12, 200           ; w
  LDI r7, 150           ; h
  LDI r6, 0x2100        ; title addr

  ; Use WINSYS instruction directly
  WINSYS r1
  ; r15 = window_id (returned by create)
  LDI r5, 0x7810
  STORE r5, r15         ; save window_id
  RET

after_create:

; Now configure HYPERVISOR to target this window
LDI r5, 0x7810
LOAD r5, r5          ; r5 = window_id
LDI r2, 0x2000        ; config string addr
HYPERVISOR r2, r5    ; boot hypervisor, target window
; r15 = 0 on success

; Show status
LDI r17, 0x7820
STRO r17, "HYPERVISOR: booting..."
LDI r18, 80
LDI r19, 200
LDI r20, 0x88FF88
DRAWTEXT r18, r19, r17, r20, r15

JMP enter_done

already_open:
; Window already exists, just show status
LDI r17, 0x7820
STRO r17, "HYPERVISOR: running"
LDI r18, 80
LDI r19, 200
LDI r20, 0x88FF88
DRAWTEXT r18, r19, r17, r20, r15

enter_done:
no_enter:

; ===== FRAME =====
FRAME
JMP main_loop
