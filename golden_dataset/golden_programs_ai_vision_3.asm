; DESCRIPTION: The assembly code demonstrates the AI Vision Bridge functionality by drawing red bars on the screen, taking a checksum of the initial state, modifying the screen with a blue square, taking another checksum after modification, and making a mock call to the vision API with the prompt "desc". The program uses specific opcodes and registers to handle these tasks.

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
LDI r6, 1
LDI r8, 0xFF0000   ; red
LDI r3, 0          ; y = 0
LDI r12, 256        ; screen width
LDI r14, 32         ; bar spacing

draw_loop:
  LDI r1, 0        ; x = 0
  draw_row:
    PSET r1, r3, r8
    ADD r1, r6     ; x++
    CMP r1, r12
    BLT r4, draw_row
  ADD r3, r6       ; y++
  CMP r3, r14
  BLT r4, draw_loop

; ── Get checksum before (op=1) ──
LDI r13, 1
AI_AGENT r13       ; r4 = checksum
MOV r7, r4        ; save in r7

; ── Modify screen -- blue square ──
LDI r8, 0x0000FF   ; blue
LDI r3, 100
LDI r14, 156

fill_y:
  LDI r1, 100
  fill_x:
    PSET r1, r3, r8
    ADD r1, r6
    CMP r1, r14
    BLT r4, fill_x
  ADD r3, r6
  CMP r3, r14
  BLT r4, fill_y

; ── Get checksum after (op=1) ──
LDI r13, 1
AI_AGENT r13       ; r4 = new checksum
MOV r9, r4        ; save in r9

; ── Vision API call with mock (op=3) ──
; Write prompt string "desc" to RAM at 0x5000
LDI r5, 0x5000
LDI r13, 0x64      ; 'd'
STORE r5, r13
LDI r2, 0x65      ; 'e'
MOV r13, r5
ADD r13, r6
STORE r13, r2
LDI r2, 0x73      ; 's'
MOV r13, r5
ADD r13, r6
ADD r13, r6
STORE r13, r2
LDI r2, 0x63      ; 'c'
MOV r13, r5
ADD r13, r6
ADD r13, r6
ADD r13, r6
STORE r13, r2
MOV r13, r5
ADD r13, r6
ADD r13, r6
ADD r13, r6
ADD r13, r6
LDI r2, 0
STORE r13, r2

; Set up registers for vision API
LDI r13, 3         ; op=3 (vision API)
MOV r10, r5       ; prompt addr
LDI r7, 0x6000    ; response addr
LDI r9, 256       ; max response length
AI_AGENT r13       ; r4 = response length

HALT
