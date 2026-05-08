; DESCRIPTION: Render a red object at the screen.

; ai_interact.asm -- AI Agent Input Demo (Phase 89)
; Demonstrates programmatic input injection via AI_INJECT opcode.
; The program injects keystrokes into itself, reads them back, and
; displays the result on screen -- proving AI can drive the GUI.

  ; Set up constants
  LDI r13, 1             ; increment constant

  ; === Phase 1: Inject a key and read it back ===
  LDI r1, 0             ; op=0 (inject key)
  LDI r8, 65            ; keycode = 65 ('A')
  LDI r10, 0             ; shift = 0
  AI_INJECT r1           ; inject 'A' into key buffer

  ; Read the injected key back
  IKEY r15               ; r15 = 65 ('A') from the key buffer

  ; Verify: draw green if correct, red if wrong
  LDI r6, 0xFF00       ; green
  LDI r4, 0xFF0000     ; red
  LDI r2, 65           ; expected value
  CMP r15, r2
  JZ r3, key_ok

  ; Wrong key -- draw red border
  LDI r20, 0
  LDI r21, 0
  LDI r22, 256
  LDI r23, 4
  RECTF r20, r21, r22, r23, r4
  JMP do_mouse

key_ok:
  ; Correct key -- draw green border
  LDI r20, 0
  LDI r21, 0
  LDI r22, 256
  LDI r23, 4
  RECTF r20, r21, r22, r23, r6

do_mouse:
  ; === Phase 2: Inject mouse move ===
  LDI r1, 1             ; op=1 (inject mouse move)
  LDI r8, 128           ; x = 128
  LDI r10, 128           ; y = 128
  AI_INJECT r1           ; inject mouse move

  ; === Phase 3: Inject mouse click ===
  LDI r1, 2             ; op=2 (inject mouse click)
  LDI r8, 100           ; x = 100
  LDI r10, 200           ; y = 200
  LDI r15, 2             ; button = 2 (click)
  AI_INJECT r1           ; inject mouse click

  ; === Phase 4: Inject text string ===
  ; Write "HI" to RAM at 0x2000
  LDI r6, 0x2000
  LDI r4, 72           ; 'H'
  STORE r6, r4
  MOV r2, r6
  ADD r2, r13           ; r2 = 0x2001
  LDI r4, 73           ; 'I'
  STORE r2, r4
  MOV r2, r6
  ADD r2, r13
  ADD r2, r13           ; r2 = 0x2002
  LDI r4, 0
  STORE r2, r4        ; null terminator

  ; Inject the text string
  LDI r1, 3             ; op=3 (inject text string)
  LDI r8, 0x2000        ; addr of null-terminated string
  AI_INJECT r1           ; inject "HI" -- r3 = count (2)

  ; Draw colored bar for each injected char
  LDI r9, 0x0000FF     ; blue
  LDI r6, 10           ; start x
  LDI r4, 10           ; y position
  LDI r2, 10           ; width
  LDI r14, 10           ; height
  LDI r11, 0            ; counter

draw_loop:
  CMP r11, r3            ; compare counter with injected count
  BGE r3, done
  RECTF r6, r4, r2, r14, r9
  LDI r16, 12
  ADD r6, r16           ; move x right
  ADD r11, r13            ; counter++
  JMP draw_loop

done:
  HALT
