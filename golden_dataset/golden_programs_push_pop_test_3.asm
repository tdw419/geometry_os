; DESCRIPTION: Draws a red object at the screen with fixed size.

; PUSH/POP test - stack operations with r30 as stack pointer
; Tests: LIFO order, SP tracking, multiple values, register reuse
; Results stored at RAM[0x0200..0x0208]

; -- Setup - point SP at top of RAM --
  LDI r30, 0xFF00

; -- Test 1 - Basic LIFO - push 3 values, pop in reverse --
  LDI r1, 100
  LDI r2, 200
  LDI r4, 300
  PUSH r1           ; push 100
  PUSH r2           ; push 200
  PUSH r4           ; push 300
  POP r8            ; r8 = 300 (top)
  POP r15            ; r15 = 200
  POP r7            ; r7 = 100
  LDI r9, 0x0200
  STORE r9, r8     ; RAM[0x0200] = 300
  LDI r9, 0x0201
  STORE r9, r15     ; RAM[0x0201] = 200
  LDI r9, 0x0202
  STORE r9, r7     ; RAM[0x0202] = 100

; -- Test 2 - Push same register multiple times --
  LDI r1, 0
  PUSH r1           ; push 0
  LDI r1, 1
  PUSH r1           ; push 1
  LDI r1, 2
  PUSH r1           ; push 2
  POP r8            ; r8 = 2
  POP r15            ; r15 = 1
  POP r7            ; r7 = 0
  LDI r9, 0x0203
  STORE r9, r8     ; RAM[0x0203] = 2
  LDI r9, 0x0204
  STORE r9, r15     ; RAM[0x0204] = 1
  LDI r9, 0x0205
  STORE r9, r7     ; RAM[0x0205] = 0

; -- Test 3 - SP restored after balanced push/pop --
; After all above operations, SP should be back at 0xFF00
; We test this by pushing a known value and popping it
  LDI r1, 42
  PUSH r1           ; push at SP = 0xFF00
  POP r8            ; r8 should be 42 if SP is correct
  LDI r9, 0x0206
  STORE r9, r8     ; RAM[0x0206] = 42

; -- Test 4 - PUSH preserves values across register reuse --
  LDI r1, 777
  PUSH r1           ; save 777
  LDI r1, 0         ; clobber r1
  ADD r1, r2        ; r1 = 0 + r2 (some garbage value)
  LDI r1, 0
  ADD r1, r4
  POP r8            ; r8 should still be 777
  LDI r9, 0x0207
  STORE r9, r8     ; RAM[0x0207] = 777

; -- Test 5 - Push 5 values, pop all 5 --
  LDI r1, 10
  PUSH r1
  LDI r1, 20
  PUSH r1
  LDI r1, 30
  PUSH r1
  LDI r1, 40
  PUSH r1
  LDI r1, 50
  PUSH r1
  ; Pop into r8 and accumulate sum
  LDI r8, 0
  POP r15
  ADD r8, r15        ; 50
  POP r15
  ADD r8, r15        ; 50+40=90
  POP r15
  ADD r8, r15        ; 90+30=120
  POP r15
  ADD r8, r15        ; 120+20=140
  POP r15
  ADD r8, r15        ; 140+10=150
  LDI r9, 0x0208
  STORE r9, r8     ; RAM[0x0208] = 150

  HALT
