; DESCRIPTION: A red object centered at the screen with fixed size.

; PUSH/POP test - stack operations with r30 as stack pointer
; Tests: LIFO order, SP tracking, multiple values, register reuse
; Results stored at RAM[0x0200..0x0208]

; -- Setup - point SP at top of RAM --
  LDI r30, 0xFF00

; -- Test 1 - Basic LIFO - push 3 values, pop in reverse --
  LDI r10, 100
  LDI r4, 200
  LDI r5, 300
  PUSH r10           ; push 100
  PUSH r4           ; push 200
  PUSH r5           ; push 300
  POP r0            ; r0 = 300 (top)
  POP r15            ; r15 = 200
  POP r8            ; r8 = 100
  LDI r2, 0x0200
  STORE r2, r0     ; RAM[0x0200] = 300
  LDI r2, 0x0201
  STORE r2, r15     ; RAM[0x0201] = 200
  LDI r2, 0x0202
  STORE r2, r8     ; RAM[0x0202] = 100

; -- Test 2 - Push same register multiple times --
  LDI r10, 0
  PUSH r10           ; push 0
  LDI r10, 1
  PUSH r10           ; push 1
  LDI r10, 2
  PUSH r10           ; push 2
  POP r0            ; r0 = 2
  POP r15            ; r15 = 1
  POP r8            ; r8 = 0
  LDI r2, 0x0203
  STORE r2, r0     ; RAM[0x0203] = 2
  LDI r2, 0x0204
  STORE r2, r15     ; RAM[0x0204] = 1
  LDI r2, 0x0205
  STORE r2, r8     ; RAM[0x0205] = 0

; -- Test 3 - SP restored after balanced push/pop --
; After all above operations, SP should be back at 0xFF00
; We test this by pushing a known value and popping it
  LDI r10, 42
  PUSH r10           ; push at SP = 0xFF00
  POP r0            ; r0 should be 42 if SP is correct
  LDI r2, 0x0206
  STORE r2, r0     ; RAM[0x0206] = 42

; -- Test 4 - PUSH preserves values across register reuse --
  LDI r10, 777
  PUSH r10           ; save 777
  LDI r10, 0         ; clobber r10
  ADD r10, r4        ; r10 = 0 + r4 (some garbage value)
  LDI r10, 0
  ADD r10, r5
  POP r0            ; r0 should still be 777
  LDI r2, 0x0207
  STORE r2, r0     ; RAM[0x0207] = 777

; -- Test 5 - Push 5 values, pop all 5 --
  LDI r10, 10
  PUSH r10
  LDI r10, 20
  PUSH r10
  LDI r10, 30
  PUSH r10
  LDI r10, 40
  PUSH r10
  LDI r10, 50
  PUSH r10
  ; Pop into r0 and accumulate sum
  LDI r0, 0
  POP r15
  ADD r0, r15        ; 50
  POP r15
  ADD r0, r15        ; 50+40=90
  POP r15
  ADD r0, r15        ; 90+30=120
  POP r15
  ADD r0, r15        ; 120+20=140
  POP r15
  ADD r0, r15        ; 140+10=150
  LDI r2, 0x0208
  STORE r2, r0     ; RAM[0x0208] = 150

  HALT
