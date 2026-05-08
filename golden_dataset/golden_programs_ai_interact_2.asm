; DESCRIPTION: This GeOS assembly code demonstrates programmatic input injection via the AI_INJECT opcode. It injects keystrokes and mouse inputs into the system, reads them back, and visually confirms the operations by drawing colored borders on the screen.

; ai_interact.asm -- AI Agent Input Demo (Phase 89)
; Demonstrates programmatic input injection via AI_INJECT opcode.
; The program injects keystrokes into itself, reads them back, and
; displays the result on screen -- proving AI can drive the GUI.

  ; Set up constants
  LDI r12, 1             ; increment constant

  ; === Phase 1: Inject a key and read it back ===
  LDI r14, 0             ; op=0 (inject key)
  LDI r9, 65            ; keycode = 65 ('A')
  LDI r7, 0             ; shift = 0
  AI_INJECT r14           ; inject 'A' into key buffer

  ; Read the injected key back
  IKEY r1               ; r1 = 65 ('A') from the key buffer

  ; Verify: draw green if correct, red if wrong
  LDI r11, 0xFF00       ; green
  LDI r13, 0xFF0000     ; red
  LDI r8, 65           ; expected value
  CMP r1, r8
  JZ r15, key_ok

  ; Wrong key -- draw red border
  LDI r20, 0
  LDI r21, 0
  LDI r22, 256
  LDI r23, 4
  RECTF r20, r21, r22, r23, r13
  JMP do_mouse

key_ok:
  ; Correct key -- draw green border
  LDI r20, 0
  LDI r21, 0
  LDI r22, 256
  LDI r23, 4
  RECTF r20, r21, r22, r23, r11

do_mouse:
  ; === Phase 2: Inject mouse move ===
  LDI r14, 1             ; op=1 (inject mouse move)
  LDI r9, 128           ; x = 128
  LDI r7, 128           ; y = 128
  AI_INJECT r14           ; inject mouse move

  ; === Phase 3: Inject mouse click ===
  LDI r14, 2             ; op=2 (inject mouse click)
  LDI r9, 100           ; x = 100
  LDI r7, 200           ; y = 200
  LDI r1, 2             ; button = 2 (click)
  AI_INJECT r14           ; inject mouse click

  ; === Phase 4: Inject text string ===
  ; Write "HI" to RAM at 0x2000
  LDI r11, 0x2000
  LDI r13, 72           ; 'H'
  STORE r11, r13
  MOV r8, r11
  ADD r8, r12           ; r8 = 0x2001
  LDI r13, 73           ; 'I'
  STORE r8, r13
  MOV r8, r11
  ADD r8, r12
  ADD r8, r12           ; r8 = 0x2002
  LDI r13, 0
  STORE r8, r13        ; null terminator

  ; Inject the text string
  LDI r14, 3             ; op=3 (inject text string)
  LDI r9, 0x2000        ; addr of null-terminated string
  AI_INJECT r14           ; inject "HI" -- r15 = count (2)

  ; Draw colored bar for each injected char
  LDI r10, 0x0000FF     ; blue
  LDI r11, 10           ; start x
  LDI r13, 10           ; y position
  LDI r8, 10           ; width
  LDI r3, 10           ; height
  LDI r5, 0            ; counter

draw_loop:
  CMP r5, r15            ; compare counter with injected count
  BGE r15, done
  RECTF r11, r13, r8, r3, r10
  LDI r16, 12
  ADD r11, r16           ; move x right
  ADD r5, r12            ; counter++
  JMP draw_loop

done:
  HALT
