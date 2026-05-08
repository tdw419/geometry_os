; DESCRIPTION: This GeOS assembly code demonstrates programmatic input injection via the AI_INJECT opcode. It injects keystrokes and mouse inputs into the system, reads them back, and visually confirms the operations by drawing colored borders on the screen.

; ai_interact.asm -- AI Agent Input Demo (Phase 89)
; Demonstrates programmatic input injection via AI_INJECT opcode.
; The program injects keystrokes into itself, reads them back, and
; displays the result on screen -- proving AI can drive the GUI.

  ; Set up constants
  LDI r12, 1             ; increment constant

  ; === Phase 1: Inject a key and read it back ===
  LDI r2, 0             ; op=0 (inject key)
  LDI r0, 65            ; keycode = 65 ('A')
  LDI r3, 0             ; shift = 0
  AI_INJECT r2           ; inject 'A' into key buffer

  ; Read the injected key back
  IKEY r5               ; r5 = 65 ('A') from the key buffer

  ; Verify: draw green if correct, red if wrong
  LDI r8, 0xFF00       ; green
  LDI r7, 0xFF0000     ; red
  LDI r6, 65           ; expected value
  CMP r5, r6
  JZ r4, key_ok

  ; Wrong key -- draw red border
  LDI r20, 0
  LDI r21, 0
  LDI r22, 256
  LDI r23, 4
  RECTF r20, r21, r22, r23, r7
  JMP do_mouse

key_ok:
  ; Correct key -- draw green border
  LDI r20, 0
  LDI r21, 0
  LDI r22, 256
  LDI r23, 4
  RECTF r20, r21, r22, r23, r8

do_mouse:
  ; === Phase 2: Inject mouse move ===
  LDI r2, 1             ; op=1 (inject mouse move)
  LDI r0, 128           ; x = 128
  LDI r3, 128           ; y = 128
  AI_INJECT r2           ; inject mouse move

  ; === Phase 3: Inject mouse click ===
  LDI r2, 2             ; op=2 (inject mouse click)
  LDI r0, 100           ; x = 100
  LDI r3, 200           ; y = 200
  LDI r5, 2             ; button = 2 (click)
  AI_INJECT r2           ; inject mouse click

  ; === Phase 4: Inject text string ===
  ; Write "HI" to RAM at 0x2000
  LDI r8, 0x2000
  LDI r7, 72           ; 'H'
  STORE r8, r7
  MOV r6, r8
  ADD r6, r12           ; r6 = 0x2001
  LDI r7, 73           ; 'I'
  STORE r6, r7
  MOV r6, r8
  ADD r6, r12
  ADD r6, r12           ; r6 = 0x2002
  LDI r7, 0
  STORE r6, r7        ; null terminator

  ; Inject the text string
  LDI r2, 3             ; op=3 (inject text string)
  LDI r0, 0x2000        ; addr of null-terminated string
  AI_INJECT r2           ; inject "HI" -- r4 = count (2)

  ; Draw colored bar for each injected char
  LDI r1, 0x0000FF     ; blue
  LDI r8, 10           ; start x
  LDI r7, 10           ; y position
  LDI r6, 10           ; width
  LDI r11, 10           ; height
  LDI r13, 0            ; counter

draw_loop:
  CMP r13, r4            ; compare counter with injected count
  BGE r4, done
  RECTF r8, r7, r6, r11, r1
  LDI r16, 12
  ADD r8, r16           ; move x right
  ADD r13, r12            ; counter++
  JMP draw_loop

done:
  HALT
