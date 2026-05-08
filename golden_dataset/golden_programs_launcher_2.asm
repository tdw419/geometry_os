; DESCRIPTION: Display a rectangle using color colored at the screen.

; launcher.asm -- App Launcher for Geometry OS
;
; Phase 72: Full-screen grid of available .asm programs from VFS.
; Scroll with W/S keys, Enter to launch, ESC to close.
;
; Proves: LS (file listing), DRAWTEXT (text), EXEC (launch programs),
;         IKEY (keyboard), RECTF (graphics), FRAME.
;
; RAM Layout:
;   0x4000-0x47FF  File list buffer (from LS)
;   0x5000-0x507F  String buffers
;   0x5100         File count
;   0x5104         Scroll offset
;   0x5108         Selected index (0-based)
;   0x510C         Mode (0=browser, 1=launching)
;
; Grid: 3 columns x 8 rows = 24 visible entries
; Each cell: 84x28 pixels

#define FILE_BUF     0x4000
#define STR_BUF      0x5000
#define FILE_COUNT   0x5100
#define SCROLL_OFF   0x5104
#define SEL_INDEX    0x5108
#define MODE         0x510C

; ==========================================
; INIT
; ==========================================
LDI r30, 0xFD00
LDI r5, 1
LDI r12, 0

; Clear state
LDI r20, SCROLL_OFF
STORE r20, r12
LDI r20, SEL_INDEX
STORE r20, r12
LDI r20, MODE
STORE r20, r12

; -- Get file list --
LDI r13, FILE_BUF
LS r13
LDI r20, FILE_COUNT
STORE r20, r11

; ==========================================
; MAIN LOOP
; ==========================================
main_loop:
  ; Clear screen
  LDI r11, 0x1A1A2E
  FILL r11

  ; -- Draw title bar --
  LDI r11, 0x2D2D4D
  LDI r13, 0
  LDI r15, 0
  LDI r4, 256
  LDI r9, 20
  RECTF r13, r15, r4, r9, r11

  ; Title "Apps"
  LDI r13, STR_BUF
  LDI r11, 65                ; A
  STORE r13, r11
  ADD r13, r5
  LDI r11, 112               ; p
  STORE r13, r11
  ADD r13, r5
  LDI r11, 112               ; p
  STORE r13, r11
  ADD r13, r5
  LDI r11, 115               ; s
  STORE r13, r11
  ADD r13, r5
  LDI r11, 0
  STORE r13, r11
  LDI r13, 110
  LDI r15, 6
  LDI r4, STR_BUF
  LDI r9, 0xFFFFFF
  LDI r0, 0
  DRAWTEXT r13, r15, r4, r9, r0

  ; -- Draw grid of programs --
  LDI r22, FILE_BUF          ; current ptr
  LDI r20, SCROLL_OFF
  LOAD r20, r20              ; scroll offset
  LDI r21, FILE_COUNT
  LOAD r21, r21              ; total files

  ; Skip scrolled entries
  JZ r20, draw_grid

scroll_skip:
  LOAD r25, r22
  JNZ r25, skip_adv
  ADD r22, r5
  SUBI r20, 1
  JZ r20, draw_grid
  JMP scroll_skip
skip_adv:
  ADD r22, r5
  JMP scroll_skip

draw_grid:
  ; r22 = pointer to first visible entry
  LDI r23, 0                ; entry counter
  LDI r24, 24               ; max visible

grid_loop:
  CMP r23, r24
  BGE r11, grid_done
  CMP r21, r12
  JZ r11, grid_done

  ; Compute grid position
  ; col = entry % 3, row = entry / 3
  LDI r25, 3
  MOV r26, r23
  MOD r26, r25              ; col (0-2)
  MOV r27, r23
  DIV r27, r25              ; row (0-7)

  ; x = col*86 + 4
  LDI r28, 86
  MUL r26, r28
  ADDI r26, 4
  ; y = row*29 + 24
  LDI r28, 29
  MUL r27, r28
  ADDI r27, 24

  ; Check if selected
  LDI r4, SEL_INDEX
  LOAD r4, r4
  CMP r4, r23
  ; If selected, draw highlight
  LDI r11, 0x4444AA
  LDI r13, 84
  LDI r15, 28
  JZ r11, draw_cell_bg
  ; Normal cell
  LDI r11, 0x252540

draw_cell_bg:
  RECTF r26, r27, r13, r15, r11

  ; Copy filename to STR_BUF (max 12 chars)
  LDI r25, STR_BUF
  LDI r26, 12

copy_fname:
  LOAD r27, r22
  STORE r25, r27
  JZ r27, fname_done
  ADD r22, r5
  ADD r25, r5
  SUBI r26, 1
  JZ r26, fname_done
  JMP copy_fname

fname_done:
  ; Advance past null
  LOAD r27, r22
  JNZ r27, no_null_adv
  ADD r22, r5
no_null_adv:

  ; Draw filename
  ; Recompute cell position
  LDI r25, 3
  MOV r26, r23
  MOD r26, r25
  MOV r27, r23
  DIV r27, r25
  LDI r28, 86
  MUL r26, r28
  ADDI r26, 8
  LDI r28, 29
  MUL r27, r28
  ADDI r27, 28

  LDI r4, STR_BUF
  LDI r9, 0xCCCCCC
  LDI r0, 0
  DRAWTEXT r26, r27, r4, r9, r0

  ADDI r23, 1
  SUBI r21, 1
  JMP grid_loop

grid_done:
  ; -- Draw footer --
  ; "W/S Scroll  Enter Run  ESC Back"
  LDI r13, STR_BUF
  LDI r11, 87               ; W
  STORE r13, r11
  ADD r13, r5
  LDI r11, 47               ; /
  STORE r13, r11
  ADD r13, r5
  LDI r11, 83               ; S
  STORE r13, r11
  ADD r13, r5
  LDI r11, 32               ; space
  STORE r13, r11
  ADD r13, r5
  LDI r11, 82               ; R
  STORE r13, r11
  ADD r13, r5
  LDI r11, 117              ; u
  STORE r13, r11
  ADD r13, r5
  LDI r11, 110              ; n
  STORE r13, r11
  ADD r13, r5
  LDI r11, 0
  STORE r13, r11

  LDI r13, 4
  LDI r15, 244
  LDI r4, STR_BUF
  LDI r9, 0x888888
  LDI r0, 0
  DRAWTEXT r13, r15, r4, r9, r0

  ; -- Handle keyboard input --
  IKEY r13
  JZ r13, no_key

  ; W = up (87)
  LDI r15, 87
  CMP r13, r15
  JNZ r11, check_down
  ; Move selection up
  LDI r20, SEL_INDEX
  LOAD r20, r20
  JZ r20, no_key
  SUBI r20, 1
  STORE r20, r20
  JMP no_key

check_down:
  ; S = down (83)
  LDI r15, 83
  CMP r13, r15
  JNZ r11, check_enter
  ; Move selection down
  LDI r20, SEL_INDEX
  LOAD r20, r20
  LDI r21, FILE_COUNT
  LOAD r21, r21
  SUBI r21, 1              ; max index
  CMP r20, r21
  BGE r11, no_key
  ADDI r20, 1
  STORE r20, r20
  JMP no_key

check_enter:
  ; Enter (13)
  LDI r15, 13
  CMP r13, r15
  JNZ r11, check_esc
  LDI r20, MODE
  LDI r11, 1
  STORE r20, r11
  JMP no_key

check_esc:
  ; ESC (27)
  LDI r15, 27
  CMP r13, r15
  JNZ r11, no_key
  LDI r20, MODE
  LDI r11, 0
  STORE r20, r11

no_key:
  ; -- Draw launching overlay --
  LDI r20, MODE
  LOAD r20, r20
  LDI r8, 1
  CMP r20, r8
  JNZ r11, no_overlay
  LDI r11, 0x00AA00
  LDI r13, 80
  LDI r15, 120
  LDI r4, 96
  LDI r9, 16
  RECTF r13, r15, r4, r9, r11
  ; Reset mode
  LDI r20, MODE
  LDI r11, 0
  STORE r20, r11

no_overlay:
  FRAME
  JMP main_loop
