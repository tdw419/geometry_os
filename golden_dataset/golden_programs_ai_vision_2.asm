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
LDI r2, 1
LDI r14, 0xFF0000   ; red
LDI r0, 0          ; y = 0
LDI r9, 256        ; screen width
LDI r15, 32         ; bar spacing

draw_loop:
  LDI r13, 0        ; x = 0
  draw_row:
    PSET r13, r0, r14
    ADD r13, r2     ; x++
    CMP r13, r9
    BLT r10, draw_row
  ADD r0, r2       ; y++
  CMP r0, r15
  BLT r10, draw_loop

; ── Get checksum before (op=1) ──
LDI r3, 1
AI_AGENT r3       ; r10 = checksum
MOV r12, r10        ; save in r12

; ── Modify screen -- blue square ──
LDI r14, 0x0000FF   ; blue
LDI r0, 100
LDI r15, 156

fill_y:
  LDI r13, 100
  fill_x:
    PSET r13, r0, r14
    ADD r13, r2
    CMP r13, r15
    BLT r10, fill_x
  ADD r0, r2
  CMP r0, r15
  BLT r10, fill_y

; ── Get checksum after (op=1) ──
LDI r3, 1
AI_AGENT r3       ; r10 = new checksum
MOV r11, r10        ; save in r11

; ── Vision API call with mock (op=3) ──
; Write prompt string "desc" to RAM at 0x5000
LDI r8, 0x5000
LDI r3, 0x64      ; 'd'
STORE r8, r3
LDI r4, 0x65      ; 'e'
MOV r3, r8
ADD r3, r2
STORE r3, r4
LDI r4, 0x73      ; 's'
MOV r3, r8
ADD r3, r2
ADD r3, r2
STORE r3, r4
LDI r4, 0x63      ; 'c'
MOV r3, r8
ADD r3, r2
ADD r3, r2
ADD r3, r2
STORE r3, r4
MOV r3, r8
ADD r3, r2
ADD r3, r2
ADD r3, r2
ADD r3, r2
LDI r4, 0
STORE r3, r4

; Set up registers for vision API
LDI r3, 3         ; op=3 (vision API)
MOV r1, r8       ; prompt addr
LDI r12, 0x6000    ; response addr
LDI r11, 256       ; max response length
AI_AGENT r3       ; r10 = response length

HALT
