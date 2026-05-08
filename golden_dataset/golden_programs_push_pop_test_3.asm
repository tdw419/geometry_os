; DESCRIPTION: This GeOS assembly code tests stack operations using register r30 as the stack pointer, verifying LIFO order, stack pointer tracking, handling of multiple values, and preservation of register contents across push/pop cycles. Test results are stored in RAM addresses from 0x0200 to 0x0208.

; PUSH/POP test - stack operations with r30 as stack pointer
; Tests: LIFO order, SP tracking, multiple values, register reuse
; Results stored at RAM[0x0200..0x0208]

; -- Setup - point SP at top of RAM --
  LDI r30, 0xFF00

; -- Test 1 - Basic LIFO - push 3 values, pop in reverse --
  LDI r0, 100
  LDI r15, 200
  LDI r6, 300
  PUSH r0           ; push 100
  PUSH r15           ; push 200
  PUSH r6           ; push 300
  POP r9            ; r9 = 300 (top)
  POP r12            ; r12 = 200
  POP r2            ; r2 = 100
  LDI r13, 0x0200
  STORE r13, r9     ; RAM[0x0200] = 300
  LDI r13, 0x0201
  STORE r13, r12     ; RAM[0x0201] = 200
  LDI r13, 0x0202
  STORE r13, r2     ; RAM[0x0202] = 100

; -- Test 2 - Push same register multiple times --
  LDI r0, 0
  PUSH r0           ; push 0
  LDI r0, 1
  PUSH r0           ; push 1
  LDI r0, 2
  PUSH r0           ; push 2
  POP r9            ; r9 = 2
  POP r12            ; r12 = 1
  POP r2            ; r2 = 0
  LDI r13, 0x0203
  STORE r13, r9     ; RAM[0x0203] = 2
  LDI r13, 0x0204
  STORE r13, r12     ; RAM[0x0204] = 1
  LDI r13, 0x0205
  STORE r13, r2     ; RAM[0x0205] = 0

; -- Test 3 - SP restored after balanced push/pop --
; After all above operations, SP should be back at 0xFF00
; We test this by pushing a known value and popping it
  LDI r0, 42
  PUSH r0           ; push at SP = 0xFF00
  POP r9            ; r9 should be 42 if SP is correct
  LDI r13, 0x0206
  STORE r13, r9     ; RAM[0x0206] = 42

; -- Test 4 - PUSH preserves values across register reuse --
  LDI r0, 777
  PUSH r0           ; save 777
  LDI r0, 0         ; clobber r0
  ADD r0, r15        ; r0 = 0 + r15 (some garbage value)
  LDI r0, 0
  ADD r0, r6
  POP r9            ; r9 should still be 777
  LDI r13, 0x0207
  STORE r13, r9     ; RAM[0x0207] = 777

; -- Test 5 - Push 5 values, pop all 5 --
  LDI r0, 10
  PUSH r0
  LDI r0, 20
  PUSH r0
  LDI r0, 30
  PUSH r0
  LDI r0, 40
  PUSH r0
  LDI r0, 50
  PUSH r0
  ; Pop into r9 and accumulate sum
  LDI r9, 0
  POP r12
  ADD r9, r12        ; 50
  POP r12
  ADD r9, r12        ; 50+40=90
  POP r12
  ADD r9, r12        ; 90+30=120
  POP r12
  ADD r9, r12        ; 120+20=140
  POP r12
  ADD r9, r12        ; 140+10=150
  LDI r13, 0x0208
  STORE r13, r9     ; RAM[0x0208] = 150

  HALT
