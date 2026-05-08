; DESCRIPTION: This GeOS assembly code initializes a memory inspector tool that displays a hex dump of RAM regions with ASCII characters alongside. It allows scrolling through memory using arrow keys and jumping to specific addresses using number keys. The code sets up a hex digit lookup table, initializes the display state, and enters a main loop where it continuously reads input, updates the view address, and redraws the screen with the current memory contents.

; meminspect.asm -- Memory Inspector for Geometry OS
;
; Phase 76: Memory Inspector
;
; Hex dump of RAM regions with ASCII alongside hex.
; Arrow keys to scroll, number keys 0-9 jump to addr*256.
;
; RAM Layout:
;   0x6000-0x60FF   String buffers
;   0x6200-0x62FF   Hex scratch
;   0x6400-0x640F   Hex digit lookup
;   0x6500          Current view address
;   0x6501          Scroll offset (rows)
;
; Screen: 14 rows of 8 bytes with hex + ASCII

#define KEY_PORT  0xFFF
#define BUF       0x6000
#define HEX_BUF   0x6200
#define HEX_TABLE 0x6400
#define VIEW_ADDR 0x6500
#define ROW_SCROLL 0x6501

LDI r30, 0xFD00
LDI r11, 1

; =========================================
; Init hex table "0123456789ABCDEF"
; =========================================
LDI r20, HEX_TABLE
LDI r21, 48
STORE r20, r21
ADD r20, r11
LDI r21, 49
STORE r20, r21
ADD r20, r11
LDI r21, 50
STORE r20, r21
ADD r20, r11
LDI r21, 51
STORE r20, r21
ADD r20, r11
LDI r21, 52
STORE r20, r21
ADD r20, r11
LDI r21, 53
STORE r20, r21
ADD r20, r11
LDI r21, 54
STORE r20, r21
ADD r20, r11
LDI r21, 55
STORE r20, r21
ADD r20, r11
LDI r21, 56
STORE r20, r21
ADD r20, r11
LDI r21, 57
STORE r20, r21
ADD r20, r11
LDI r21, 65
STORE r20, r21
ADD r20, r11
LDI r21, 66
STORE r20, r21
ADD r20, r11
LDI r21, 67
STORE r20, r21
ADD r20, r11
LDI r21, 68
STORE r20, r21
ADD r20, r11
LDI r21, 69
STORE r20, r21
ADD r20, r11
LDI r21, 70
STORE r20, r21

; Init state
LDI r20, VIEW_ADDR
LDI r12, 0x2000
STORE r20, r12
LDI r20, ROW_SCROLL
LDI r12, 0
STORE r20, r12

; Demo data at 0x2000
LDI r20, 0x2000
LDI r21, 72
STORE r20, r21
ADD r20, r11
LDI r21, 101
STORE r20, r21
ADD r20, r11
LDI r21, 108
STORE r20, r21
ADD r20, r11
LDI r21, 108
STORE r20, r21
ADD r20, r11
LDI r21, 111
STORE r20, r21
ADD r20, r11
LDI r21, 44
STORE r20, r21
ADD r20, r11
LDI r21, 32
STORE r20, r21
ADD r20, r11
LDI r21, 87
STORE r20, r21

; =========================================
; MAIN LOOP
; =========================================
main_loop:
  IKEY r6

  LDI r8, 38
  CMP r6, r8
  JZ r7, do_up

  LDI r8, 40
  CMP r6, r8
  JZ r7, do_down

  ; Number keys 0-9
  LDI r8, 48
  CMP r6, r8
  BLT r7, do_draw

  LDI r8, 58
  CMP r6, r8
  BGE r7, do_draw

  LDI r8, 48
  SUB r6, r8
  LDI r8, 256
  MUL r6, r8
  LDI r20, VIEW_ADDR
  STORE r20, r6
  LDI r20, ROW_SCROLL
  LDI r12, 0
  STORE r20, r12
  JMP do_draw

do_up:
  LDI r20, ROW_SCROLL
  LOAD r12, r20
  LDI r8, 0
  CMP r12, r8
  JZ r7, do_draw
  SUB r12, r11
  STORE r20, r12
  JMP do_draw

do_down:
  LDI r20, ROW_SCROLL
  LOAD r12, r20
  ADD r12, r11
  LDI r8, 32
  CMP r12, r8
  BGE r7, do_draw
  STORE r20, r12
  JMP do_draw

; =========================================
; DRAW
; =========================================
do_draw:
  ; Background
  LDI r15, 0x080818
  FILL r15

  ; Title bar
  LDI r15, 0
  LDI r5, 0
  LDI r13, 256
  LDI r10, 16
  LDI r0, 0x004488
  RECTF r15, r5, r13, r10, r0

  LDI r20, BUF
  STRO r20, "Memory Inspector"
  LDI r15, 30
  LDI r5, 3
  LDI r13, BUF
  LDI r10, 0xFFFFFF
  LDI r0, 0x004488
  DRAWTEXT r15, r5, r13, r10, r0

  ; Compute effective start address
  LDI r20, VIEW_ADDR
  LOAD r14, r20
  LDI r20, ROW_SCROLL
  LOAD r2, r20
  LDI r8, 8
  MUL r2, r8
  ADD r14, r2          ; r14 = start addr for display

  ; Draw 14 hex dump rows
  LDI r1, 0            ; row counter
  LDI r3, 22           ; y position

  ; Note: no CALL inside this loop, all inline

nxt_row:
  ; Build address in BUF (4 hex chars)
  LDI r21, BUF
  ; Extract nibbles from r14 (only low 16 bits for display)
  LDI r22, 12
nxt_addr_nib:
  MOV r2, r14
  MOV r16, r22
  SHR r2, r16
  LDI r16, 0xF
  AND r2, r16
  LDI r16, HEX_TABLE
  ADD r16, r2
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r11
  SUB r22, r11
  LDI r16, 0
  CMP r22, r16
  BLT r7, addr_done
  ; But we need 4 digits only (bits 15:0), so iterate 4 times with shifts 12,8,4,0
  ; Actually we want 8 hex digits for full u32
  ; Let's just do the full 8-digit address
  LDI r16, 0
  CMP r22, r16
  JNZ r7, nxt_addr_nib
addr_done:
  ; Hmm, this loop structure is wrong. Let me do it simpler.
  ; Just write 4 hex digits for the low 16 bits

  ; Actually, let me inline it simply:
  ; Build "XXXX:" where XXXX is the address in hex
  LDI r21, BUF

  ; Nibble 3 (bits 15:12)
  MOV r2, r14
  LDI r16, 12
  SHR r2, r16
  LDI r16, 0xF
  AND r2, r16
  LDI r16, HEX_TABLE
  ADD r16, r2
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r11

  ; Nibble 2 (bits 11:8)
  MOV r2, r14
  LDI r16, 8
  SHR r2, r16
  LDI r16, 0xF
  AND r2, r16
  LDI r16, HEX_TABLE
  ADD r16, r2
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r11

  ; Nibble 1 (bits 7:4)
  MOV r2, r14
  LDI r16, 4
  SHR r2, r16
  LDI r16, 0xF
  AND r2, r16
  LDI r16, HEX_TABLE
  ADD r16, r2
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r11

  ; Nibble 0 (bits 3:0)
  MOV r2, r14
  LDI r16, 0xF
  AND r2, r16
  LDI r16, HEX_TABLE
  ADD r16, r2
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r11

  ; Colon + space
  LDI r16, 58           ; ':'
  STORE r21, r16
  ADD r21, r11
  LDI r16, 32           ; ' '
  STORE r21, r16
  ADD r21, r11

  ; Read 8 bytes, write hex
  MOV r26, r14
  LDI r25, 0
nxt_byte:
  LOAD r12, r26

  ; High nibble
  LDI r15, 4
  SHR r12, r15
  LDI r15, 0xF
  AND r12, r15
  LDI r15, HEX_TABLE
  ADD r15, r12
  LOAD r15, r15
  STORE r21, r15
  ADD r21, r11

  ; Low nibble
  LOAD r12, r26
  LDI r15, 0xF
  AND r12, r15
  LDI r15, HEX_TABLE
  ADD r15, r12
  LOAD r15, r15
  STORE r21, r15
  ADD r21, r11

  ; Space
  LDI r15, 32
  STORE r21, r15
  ADD r21, r11

  ADD r26, r11
  ADD r25, r11
  LDI r15, 8
  CMP r25, r15
  BLT r7, nxt_byte

  ; " |" separator
  LDI r15, 32
  STORE r21, r15
  ADD r21, r11
  LDI r15, 124          ; '|'
  STORE r21, r15
  ADD r21, r11

  ; ASCII
  MOV r26, r14
  LDI r25, 0
nxt_ascii:
  LOAD r12, r26
  LDI r15, 32
  CMP r12, r15
  BLT r7, put_dot
  LDI r15, 127
  CMP r12, r15
  BGE r7, put_dot
  STORE r21, r12
  JMP nxt_asc2
put_dot:
  LDI r15, 46
  STORE r21, r15
nxt_asc2:
  ADD r21, r11
  ADD r26, r11
  ADD r25, r11
  LDI r15, 8
  CMP r25, r15
  BLT r7, nxt_ascii

  ; Trailing | and null
  LDI r15, 124
  STORE r21, r15
  ADD r21, r11
  LDI r15, 0
  STORE r21, r15

  ; Draw
  LDI r15, 2
  MOV r5, r3
  LDI r13, BUF
  LDI r10, 0xCCCCCC
  LDI r0, 0x080818
  DRAWTEXT r15, r5, r13, r10, r0

  ; Advance by 8
  LDI r8, 8
  ADD r14, r8
  LDI r8, 15
  ADD r3, r8
  ADD r1, r11
  LDI r8, 14
  CMP r1, r8
  BLT r7, nxt_row

  ; Status bar
  LDI r15, 0
  LDI r5, 236
  LDI r13, 256
  LDI r10, 20
  LDI r0, 0x1A1A2E
  RECTF r15, r5, r13, r10, r0

  LDI r20, BUF
  STRO r20, "Up/Dn:Scroll 0-9:Jump"
  LDI r15, 4
  LDI r5, 238
  LDI r13, BUF
  LDI r10, 0x888888
  LDI r0, 0x1A1A2E
  DRAWTEXT r15, r5, r13, r10, r0

  FRAME
  JMP main_loop
