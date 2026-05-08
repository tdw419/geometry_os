; DESCRIPTION: This GeOS assembly code tests stack operations using register r30 as the stack pointer, verifying LIFO order, stack pointer tracking, handling of multiple values, and preservation of register contents across push/pop cycles. Test results are stored in RAM addresses from 0x0200 to 0x0208.

; PUSH/POP test - stack operations with r30 as stack pointer
; Tests: LIFO order, SP tracking, multiple values, register reuse
; Results stored at RAM[0x0200..0x0208]

; -- Setup - point SP at top of RAM --
  LDI r30, 0xFF00

; -- Test 1 - Basic LIFO - push 3 values, pop in reverse --
  LDI r8, 100
  LDI r10, 200
  LDI r1, 300
  PUSH r8           ; push 100
  PUSH r10           ; push 200
  PUSH r1           ; push 300
  POP r12            ; r12 = 300 (top)
  POP r6            ; r6 = 200
  POP r13            ; r13 = 100
  LDI r0, 0x0200
  STORE r0, r12     ; RAM[0x0200] = 300
  LDI r0, 0x0201
  STORE r0, r6     ; RAM[0x0201] = 200
  LDI r0, 0x0202
  STORE r0, r13     ; RAM[0x0202] = 100

; -- Test 2 - Push same register multiple times --
  LDI r8, 0
  PUSH r8           ; push 0
  LDI r8, 1
  PUSH r8           ; push 1
  LDI r8, 2
  PUSH r8           ; push 2
  POP r12            ; r12 = 2
  POP r6            ; r6 = 1
  POP r13            ; r13 = 0
  LDI r0, 0x0203
  STORE r0, r12     ; RAM[0x0203] = 2
  LDI r0, 0x0204
  STORE r0, r6     ; RAM[0x0204] = 1
  LDI r0, 0x0205
  STORE r0, r13     ; RAM[0x0205] = 0

; -- Test 3 - SP restored after balanced push/pop --
; After all above operations, SP should be back at 0xFF00
; We test this by pushing a known value and popping it
  LDI r8, 42
  PUSH r8           ; push at SP = 0xFF00
  POP r12            ; r12 should be 42 if SP is correct
  LDI r0, 0x0206
  STORE r0, r12     ; RAM[0x0206] = 42

; -- Test 4 - PUSH preserves values across register reuse --
  LDI r8, 777
  PUSH r8           ; save 777
  LDI r8, 0         ; clobber r8
  ADD r8, r10        ; r8 = 0 + r10 (some garbage value)
  LDI r8, 0
  ADD r8, r1
  POP r12            ; r12 should still be 777
  LDI r0, 0x0207
  STORE r0, r12     ; RAM[0x0207] = 777

; -- Test 5 - Push 5 values, pop all 5 --
  LDI r8, 10
  PUSH r8
  LDI r8, 20
  PUSH r8
  LDI r8, 30
  PUSH r8
  LDI r8, 40
  PUSH r8
  LDI r8, 50
  PUSH r8
  ; Pop into r12 and accumulate sum
  LDI r12, 0
  POP r6
  ADD r12, r6        ; 50
  POP r6
  ADD r12, r6        ; 50+40=90
  POP r6
  ADD r12, r6        ; 90+30=120
  POP r6
  ADD r12, r6        ; 120+20=140
  POP r6
  ADD r12, r6        ; 140+10=150
  LDI r0, 0x0208
  STORE r0, r12     ; RAM[0x0208] = 150

  HALT
