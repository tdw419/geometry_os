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
LDI r3, 1

; =========================================
; Init hex table "0123456789ABCDEF"
; =========================================
LDI r20, HEX_TABLE
LDI r21, 48
STORE r20, r21
ADD r20, r3
LDI r21, 49
STORE r20, r21
ADD r20, r3
LDI r21, 50
STORE r20, r21
ADD r20, r3
LDI r21, 51
STORE r20, r21
ADD r20, r3
LDI r21, 52
STORE r20, r21
ADD r20, r3
LDI r21, 53
STORE r20, r21
ADD r20, r3
LDI r21, 54
STORE r20, r21
ADD r20, r3
LDI r21, 55
STORE r20, r21
ADD r20, r3
LDI r21, 56
STORE r20, r21
ADD r20, r3
LDI r21, 57
STORE r20, r21
ADD r20, r3
LDI r21, 65
STORE r20, r21
ADD r20, r3
LDI r21, 66
STORE r20, r21
ADD r20, r3
LDI r21, 67
STORE r20, r21
ADD r20, r3
LDI r21, 68
STORE r20, r21
ADD r20, r3
LDI r21, 69
STORE r20, r21
ADD r20, r3
LDI r21, 70
STORE r20, r21

; Init state
LDI r20, VIEW_ADDR
LDI r10, 0x2000
STORE r20, r10
LDI r20, ROW_SCROLL
LDI r10, 0
STORE r20, r10

; Demo data at 0x2000
LDI r20, 0x2000
LDI r21, 72
STORE r20, r21
ADD r20, r3
LDI r21, 101
STORE r20, r21
ADD r20, r3
LDI r21, 108
STORE r20, r21
ADD r20, r3
LDI r21, 108
STORE r20, r21
ADD r20, r3
LDI r21, 111
STORE r20, r21
ADD r20, r3
LDI r21, 44
STORE r20, r21
ADD r20, r3
LDI r21, 32
STORE r20, r21
ADD r20, r3
LDI r21, 87
STORE r20, r21

; =========================================
; MAIN LOOP
; =========================================
main_loop:
  IKEY r4

  LDI r6, 38
  CMP r4, r6
  JZ r8, do_up

  LDI r6, 40
  CMP r4, r6
  JZ r8, do_down

  ; Number keys 0-9
  LDI r6, 48
  CMP r4, r6
  BLT r8, do_draw

  LDI r6, 58
  CMP r4, r6
  BGE r8, do_draw

  LDI r6, 48
  SUB r4, r6
  LDI r6, 256
  MUL r4, r6
  LDI r20, VIEW_ADDR
  STORE r20, r4
  LDI r20, ROW_SCROLL
  LDI r10, 0
  STORE r20, r10
  JMP do_draw

do_up:
  LDI r20, ROW_SCROLL
  LOAD r10, r20
  LDI r6, 0
  CMP r10, r6
  JZ r8, do_draw
  SUB r10, r3
  STORE r20, r10
  JMP do_draw

do_down:
  LDI r20, ROW_SCROLL
  LOAD r10, r20
  ADD r10, r3
  LDI r6, 32
  CMP r10, r6
  BGE r8, do_draw
  STORE r20, r10
  JMP do_draw

; =========================================
; DRAW
; =========================================
do_draw:
  ; Background
  LDI r9, 0x080818
  FILL r9

  ; Title bar
  LDI r9, 0
  LDI r11, 0
  LDI r2, 256
  LDI r15, 16
  LDI r7, 0x004488
  RECTF r9, r11, r2, r15, r7

  LDI r20, BUF
  STRO r20, "Memory Inspector"
  LDI r9, 30
  LDI r11, 3
  LDI r2, BUF
  LDI r15, 0xFFFFFF
  LDI r7, 0x004488
  DRAWTEXT r9, r11, r2, r15, r7

  ; Compute effective start address
  LDI r20, VIEW_ADDR
  LOAD r13, r20
  LDI r20, ROW_SCROLL
  LOAD r12, r20
  LDI r6, 8
  MUL r12, r6
  ADD r13, r12          ; r13 = start addr for display

  ; Draw 14 hex dump rows
  LDI r0, 0            ; row counter
  LDI r1, 22           ; y position

  ; Note: no CALL inside this loop, all inline

nxt_row:
  ; Build address in BUF (4 hex chars)
  LDI r21, BUF
  ; Extract nibbles from r13 (only low 16 bits for display)
  LDI r22, 12
nxt_addr_nib:
  MOV r12, r13
  MOV r16, r22
  SHR r12, r16
  LDI r16, 0xF
  AND r12, r16
  LDI r16, HEX_TABLE
  ADD r16, r12
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r3
  SUB r22, r3
  LDI r16, 0
  CMP r22, r16
  BLT r8, addr_done
  ; But we need 4 digits only (bits 15:0), so iterate 4 times with shifts 12,8,4,0
  ; Actually we want 8 hex digits for full u32
  ; Let's just do the full 8-digit address
  LDI r16, 0
  CMP r22, r16
  JNZ r8, nxt_addr_nib
addr_done:
  ; Hmm, this loop structure is wrong. Let me do it simpler.
  ; Just write 4 hex digits for the low 16 bits

  ; Actually, let me inline it simply:
  ; Build "XXXX:" where XXXX is the address in hex
  LDI r21, BUF

  ; Nibble 3 (bits 15:12)
  MOV r12, r13
  LDI r16, 12
  SHR r12, r16
  LDI r16, 0xF
  AND r12, r16
  LDI r16, HEX_TABLE
  ADD r16, r12
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r3

  ; Nibble 2 (bits 11:8)
  MOV r12, r13
  LDI r16, 8
  SHR r12, r16
  LDI r16, 0xF
  AND r12, r16
  LDI r16, HEX_TABLE
  ADD r16, r12
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r3

  ; Nibble 1 (bits 7:4)
  MOV r12, r13
  LDI r16, 4
  SHR r12, r16
  LDI r16, 0xF
  AND r12, r16
  LDI r16, HEX_TABLE
  ADD r16, r12
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r3

  ; Nibble 0 (bits 3:0)
  MOV r12, r13
  LDI r16, 0xF
  AND r12, r16
  LDI r16, HEX_TABLE
  ADD r16, r12
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r3

  ; Colon + space
  LDI r16, 58           ; ':'
  STORE r21, r16
  ADD r21, r3
  LDI r16, 32           ; ' '
  STORE r21, r16
  ADD r21, r3

  ; Read 8 bytes, write hex
  MOV r26, r13
  LDI r25, 0
nxt_byte:
  LOAD r10, r26

  ; High nibble
  LDI r9, 4
  SHR r10, r9
  LDI r9, 0xF
  AND r10, r9
  LDI r9, HEX_TABLE
  ADD r9, r10
  LOAD r9, r9
  STORE r21, r9
  ADD r21, r3

  ; Low nibble
  LOAD r10, r26
  LDI r9, 0xF
  AND r10, r9
  LDI r9, HEX_TABLE
  ADD r9, r10
  LOAD r9, r9
  STORE r21, r9
  ADD r21, r3

  ; Space
  LDI r9, 32
  STORE r21, r9
  ADD r21, r3

  ADD r26, r3
  ADD r25, r3
  LDI r9, 8
  CMP r25, r9
  BLT r8, nxt_byte

  ; " |" separator
  LDI r9, 32
  STORE r21, r9
  ADD r21, r3
  LDI r9, 124          ; '|'
  STORE r21, r9
  ADD r21, r3

  ; ASCII
  MOV r26, r13
  LDI r25, 0
nxt_ascii:
  LOAD r10, r26
  LDI r9, 32
  CMP r10, r9
  BLT r8, put_dot
  LDI r9, 127
  CMP r10, r9
  BGE r8, put_dot
  STORE r21, r10
  JMP nxt_asc2
put_dot:
  LDI r9, 46
  STORE r21, r9
nxt_asc2:
  ADD r21, r3
  ADD r26, r3
  ADD r25, r3
  LDI r9, 8
  CMP r25, r9
  BLT r8, nxt_ascii

  ; Trailing | and null
  LDI r9, 124
  STORE r21, r9
  ADD r21, r3
  LDI r9, 0
  STORE r21, r9

  ; Draw
  LDI r9, 2
  MOV r11, r1
  LDI r2, BUF
  LDI r15, 0xCCCCCC
  LDI r7, 0x080818
  DRAWTEXT r9, r11, r2, r15, r7

  ; Advance by 8
  LDI r6, 8
  ADD r13, r6
  LDI r6, 15
  ADD r1, r6
  ADD r0, r3
  LDI r6, 14
  CMP r0, r6
  BLT r8, nxt_row

  ; Status bar
  LDI r9, 0
  LDI r11, 236
  LDI r2, 256
  LDI r15, 20
  LDI r7, 0x1A1A2E
  RECTF r9, r11, r2, r15, r7

  LDI r20, BUF
  STRO r20, "Up/Dn:Scroll 0-9:Jump"
  LDI r9, 4
  LDI r11, 238
  LDI r2, BUF
  LDI r15, 0x888888
  LDI r7, 0x1A1A2E
  DRAWTEXT r9, r11, r2, r15, r7

  FRAME
  JMP main_loop
