; DESCRIPTION: This GeOS assembly code defines three words: `HELLO`, `SQUARE`, and `COUNTDOWN`. The `HELLO` word outputs "Hello from Forth!" to the debug port. The `SQUARE` word calculates the square of a number provided on the stack. The `COUNTDOWN` word prints numbers from the given starting point down to 1, with each number followed by a newline. The main execution flow calls `HELLO`, then prints "5 squared = ", computes the square of 5 using `SQUARE`, and finally counts down from 5 using `COUNTDOWN`.

word_0:
; : HELLO 
  ; dotquote:  Hello from Forth!
  LDI r10, 32
  LDI r12, 0xFFB
  STORE r12, r10    ; emit char
  LDI r10, 72
  LDI r12, 0xFFB
  STORE r12, r10    ; emit char
  LDI r10, 101
  LDI r12, 0xFFB
  STORE r12, r10    ; emit char
  LDI r10, 108
  LDI r12, 0xFFB
  STORE r12, r10    ; emit char
  LDI r10, 108
  LDI r12, 0xFFB
  STORE r12, r10    ; emit char
  LDI r10, 111
  LDI r12, 0xFFB
  STORE r12, r10    ; emit char
  LDI r10, 32
  LDI r12, 0xFFB
  STORE r12, r10    ; emit char
  LDI r10, 102
  LDI r12, 0xFFB
  STORE r12, r10    ; emit char
  LDI r10, 114
  LDI r12, 0xFFB
  STORE r12, r10    ; emit char
  LDI r10, 111
  LDI r12, 0xFFB
  STORE r12, r10    ; emit char
  LDI r10, 109
  LDI r12, 0xFFB
  STORE r12, r10    ; emit char
  LDI r10, 32
  LDI r12, 0xFFB
  STORE r12, r10    ; emit char
  LDI r10, 70
  LDI r12, 0xFFB
  STORE r12, r10    ; emit char
  LDI r10, 111
  LDI r12, 0xFFB
  STORE r12, r10    ; emit char
  LDI r10, 114
  LDI r12, 0xFFB
  STORE r12, r10    ; emit char
  LDI r10, 116
  LDI r12, 0xFFB
  STORE r12, r10    ; emit char
  LDI r10, 104
  LDI r12, 0xFFB
  STORE r12, r10    ; emit char
  LDI r10, 33
  LDI r12, 0xFFB
  STORE r12, r10    ; emit char
  LDI r10, 10
  LDI r12, 0xFFB
  STORE r12, r10    ; newline
RET
word_1:
; : SQUARE 
  LDI r10, 1
  LOAD r10, [r30]       ; DUP: peek TOS
  PUSH r10
  LOAD r1, [r30]       ; TOS
  LDI r10, 1
  ADD r30, r10          ; SP++
  LOAD r14, [r30]       ; NOS
  MUL r1, r14           ; TOS * NOS
  STORE [r30], r1
RET
word_2:
; : COUNTDOWN 
  begin_3:
  LDI r10, 1
  LOAD r10, [r30]       ; DUP: peek TOS
  PUSH r10
  LOAD r10, [r30]       ; pop number
  LDI r14, 1
  ADD r30, r14
  LDI r12, 0xFFB
  STORE r12, r10    ; write to debug port
  LDI r10, 10
  LDI r12, 0xFFB
  STORE r12, r10    ; newline
  LDI r10, 1
  LOAD r14, [r30]
  SUB r14, r10
  STORE [r30], r14
  LDI r10, 1
  LOAD r10, [r30]       ; DUP: peek TOS
  PUSH r10
  LOAD r10, [r30]
  CMPI r10, 0
  JZ r4, zerogt_4_false
  LDI r10, 1
  JMP zerogt_4_done
  zerogt_4_false:
  LDI r10, 0
  zerogt_4_done:
  STORE [r30], r10
  LOAD r10, [r30]       ; pop condition
  LDI r14, 1
  ADD r30, r14
  CMPI r10, 0
  JZ r4, begin_3
  LDI r4, 1
  ADD r30, r4          ; DROP: pop TOS
RET
CALL word_0
; (call HELLO)
; dotquote:  5 squared = 
LDI r10, 32
LDI r12, 0xFFB
STORE r12, r10    ; emit char
LDI r10, 53
LDI r12, 0xFFB
STORE r12, r10    ; emit char
LDI r10, 32
LDI r12, 0xFFB
STORE r12, r10    ; emit char
LDI r10, 115
LDI r12, 0xFFB
STORE r12, r10    ; emit char
LDI r10, 113
LDI r12, 0xFFB
STORE r12, r10    ; emit char
LDI r10, 117
LDI r12, 0xFFB
STORE r12, r10    ; emit char
LDI r10, 97
LDI r12, 0xFFB
STORE r12, r10    ; emit char
LDI r10, 114
LDI r12, 0xFFB
STORE r12, r10    ; emit char
LDI r10, 101
LDI r12, 0xFFB
STORE r12, r10    ; emit char
LDI r10, 100
LDI r12, 0xFFB
STORE r12, r10    ; emit char
LDI r10, 32
LDI r12, 0xFFB
STORE r12, r10    ; emit char
LDI r10, 61
LDI r12, 0xFFB
STORE r12, r10    ; emit char
LDI r10, 32
LDI r12, 0xFFB
STORE r12, r10    ; emit char
LDI r10, 5
PUSH r10
CALL word_1
; (call SQUARE)
LOAD r10, [r30]       ; pop number
LDI r14, 1
ADD r30, r14
LDI r12, 0xFFB
STORE r12, r10    ; write to debug port
LDI r10, 10
LDI r12, 0xFFB
STORE r12, r10    ; newline
; dotquote:  Countdown from 5:
LDI r10, 32
LDI r12, 0xFFB
STORE r12, r10    ; emit char
LDI r10, 67
LDI r12, 0xFFB
STORE r12, r10    ; emit char
LDI r10, 111
LDI r12, 0xFFB
STORE r12, r10    ; emit char
LDI r10, 117
LDI r12, 0xFFB
STORE r12, r10    ; emit char
LDI r10, 110
LDI r12, 0xFFB
STORE r12, r10    ; emit char
LDI r10, 116
LDI r12, 0xFFB
STORE r12, r10    ; emit char
LDI r10, 100
LDI r12, 0xFFB
STORE r12, r10    ; emit char
LDI r10, 111
LDI r12, 0xFFB
STORE r12, r10    ; emit char
LDI r10, 119
LDI r12, 0xFFB
STORE r12, r10    ; emit char
LDI r10, 110
LDI r12, 0xFFB
STORE r12, r10    ; emit char
LDI r10, 32
LDI r12, 0xFFB
STORE r12, r10    ; emit char
LDI r10, 102
LDI r12, 0xFFB
STORE r12, r10    ; emit char
LDI r10, 114
LDI r12, 0xFFB
STORE r12, r10    ; emit char
LDI r10, 111
LDI r12, 0xFFB
STORE r12, r10    ; emit char
LDI r10, 109
LDI r12, 0xFFB
STORE r12, r10    ; emit char
LDI r10, 32
LDI r12, 0xFFB
STORE r12, r10    ; emit char
LDI r10, 53
LDI r12, 0xFFB
STORE r12, r10    ; emit char
LDI r10, 58
LDI r12, 0xFFB
STORE r12, r10    ; emit char
LDI r10, 10
LDI r12, 0xFFB
STORE r12, r10    ; newline
LDI r10, 5
PUSH r10
CALL word_2
; (call COUNTDOWN)
HALT