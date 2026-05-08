; DESCRIPTION: Render a red square at the screen.

; ai_vision.asm -- Phase 88: AI Vision Bridge demo
;
; Demonstrates the AI_AGENT opcode:
;   op=0: screenshot to VFS file
;   op=1: canvas checksum
;   op=3: vision API call (with mock response)
;
; The program draws red bars, takes a checksum,
; modifies the screen, takes another checksum, and calls the vision API.

; ── Draw red bars ──
LDI r9, 1
LDI r5, 0xFF0000   ; red
LDI r11, 0          ; y = 0
LDI r15, 256        ; screen width
LDI r13, 32         ; bar spacing

draw_loop:
  LDI r7, 0        ; x = 0
  draw_row:
    PSET r7, r11, r5
    ADD r7, r9     ; x++
    CMP r7, r15
    BLT r6, draw_row
  ADD r11, r9       ; y++
  CMP r11, r13
  BLT r6, draw_loop

; ── Get checksum before (op=1) ──
LDI r14, 1
AI_AGENT r14       ; r6 = checksum
MOV r3, r6        ; save in r3

; ── Modify screen -- blue square ──
LDI r5, 0x0000FF   ; blue
LDI r11, 100
LDI r13, 156

fill_y:
  LDI r7, 100
  fill_x:
    PSET r7, r11, r5
    ADD r7, r9
    CMP r7, r13
    BLT r6, fill_x
  ADD r11, r9
  CMP r11, r13
  BLT r6, fill_y

; ── Get checksum after (op=1) ──
LDI r14, 1
AI_AGENT r14       ; r6 = new checksum
MOV r0, r6        ; save in r0

; ── Vision API call with mock (op=3) ──
; Write prompt string "desc" to RAM at 0x5000
LDI r2, 0x5000
LDI r14, 0x64      ; 'd'
STORE r2, r14
LDI r8, 0x65      ; 'e'
MOV r14, r2
ADD r14, r9
STORE r14, r8
LDI r8, 0x73      ; 's'
MOV r14, r2
ADD r14, r9
ADD r14, r9
STORE r14, r8
LDI r8, 0x63      ; 'c'
MOV r14, r2
ADD r14, r9
ADD r14, r9
ADD r14, r9
STORE r14, r8
MOV r14, r2
ADD r14, r9
ADD r14, r9
ADD r14, r9
ADD r14, r9
LDI r8, 0
STORE r14, r8

; Set up registers for vision API
LDI r14, 3         ; op=3 (vision API)
MOV r1, r2       ; prompt addr
LDI r3, 0x6000    ; response addr
LDI r0, 256       ; max response length
AI_AGENT r14       ; r6 = response length

HALT
