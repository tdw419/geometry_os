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
LDI r1, 1
LDI r9, 0xFF0000   ; red
LDI r10, 0          ; y = 0
LDI r4, 256        ; screen width
LDI r8, 32         ; bar spacing

draw_loop:
  LDI r15, 0        ; x = 0
  draw_row:
    PSET r15, r10, r9
    ADD r15, r1     ; x++
    CMP r15, r4
    BLT r7, draw_row
  ADD r10, r1       ; y++
  CMP r10, r8
  BLT r7, draw_loop

; ── Get checksum before (op=1) ──
LDI r14, 1
AI_AGENT r14       ; r7 = checksum
MOV r3, r7        ; save in r3

; ── Modify screen -- blue square ──
LDI r9, 0x0000FF   ; blue
LDI r10, 100
LDI r8, 156

fill_y:
  LDI r15, 100
  fill_x:
    PSET r15, r10, r9
    ADD r15, r1
    CMP r15, r8
    BLT r7, fill_x
  ADD r10, r1
  CMP r10, r8
  BLT r7, fill_y

; ── Get checksum after (op=1) ──
LDI r14, 1
AI_AGENT r14       ; r7 = new checksum
MOV r13, r7        ; save in r13

; ── Vision API call with mock (op=3) ──
; Write prompt string "desc" to RAM at 0x5000
LDI r6, 0x5000
LDI r14, 0x64      ; 'd'
STORE r6, r14
LDI r12, 0x65      ; 'e'
MOV r14, r6
ADD r14, r1
STORE r14, r12
LDI r12, 0x73      ; 's'
MOV r14, r6
ADD r14, r1
ADD r14, r1
STORE r14, r12
LDI r12, 0x63      ; 'c'
MOV r14, r6
ADD r14, r1
ADD r14, r1
ADD r14, r1
STORE r14, r12
MOV r14, r6
ADD r14, r1
ADD r14, r1
ADD r14, r1
ADD r14, r1
LDI r12, 0
STORE r14, r12

; Set up registers for vision API
LDI r14, 3         ; op=3 (vision API)
MOV r2, r6       ; prompt addr
LDI r3, 0x6000    ; response addr
LDI r13, 256       ; max response length
AI_AGENT r14       ; r7 = response length

HALT
