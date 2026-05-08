; DESCRIPTION: This GeOS assembly code defines three words: `HELLO`, `SQUARE`, and `COUNTDOWN`. The `HELLO` word outputs "Hello from Forth!" to the debug port. The `SQUARE` word calculates the square of a number provided on the stack. The `COUNTDOWN` word prints numbers from the given starting point down to 1, with each number followed by a newline. The main execution flow calls `HELLO`, then prints "5 squared = ", computes the square of 5 using `SQUARE`, and finally counts down from 5 using `COUNTDOWN`.

word_0:
; : HELLO 
  ; dotquote:  Hello from Forth!
  LDI r8, 32
  LDI r10, 0xFFB
  STORE r10, r8    ; emit char
  LDI r8, 72
  LDI r10, 0xFFB
  STORE r10, r8    ; emit char
  LDI r8, 101
  LDI r10, 0xFFB
  STORE r10, r8    ; emit char
  LDI r8, 108
  LDI r10, 0xFFB
  STORE r10, r8    ; emit char
  LDI r8, 108
  LDI r10, 0xFFB
  STORE r10, r8    ; emit char
  LDI r8, 111
  LDI r10, 0xFFB
  STORE r10, r8    ; emit char
  LDI r8, 32
  LDI r10, 0xFFB
  STORE r10, r8    ; emit char
  LDI r8, 102
  LDI r10, 0xFFB
  STORE r10, r8    ; emit char
  LDI r8, 114
  LDI r10, 0xFFB
  STORE r10, r8    ; emit char
  LDI r8, 111
  LDI r10, 0xFFB
  STORE r10, r8    ; emit char
  LDI r8, 109
  LDI r10, 0xFFB
  STORE r10, r8    ; emit char
  LDI r8, 32
  LDI r10, 0xFFB
  STORE r10, r8    ; emit char
  LDI r8, 70
  LDI r10, 0xFFB
  STORE r10, r8    ; emit char
  LDI r8, 111
  LDI r10, 0xFFB
  STORE r10, r8    ; emit char
  LDI r8, 114
  LDI r10, 0xFFB
  STORE r10, r8    ; emit char
  LDI r8, 116
  LDI r10, 0xFFB
  STORE r10, r8    ; emit char
  LDI r8, 104
  LDI r10, 0xFFB
  STORE r10, r8    ; emit char
  LDI r8, 33
  LDI r10, 0xFFB
  STORE r10, r8    ; emit char
  LDI r8, 10
  LDI r10, 0xFFB
  STORE r10, r8    ; newline
RET
word_1:
; : SQUARE 
  LDI r8, 1
  LOAD r8, [r30]       ; DUP: peek TOS
  PUSH r8
  LOAD r9, [r30]       ; TOS
  LDI r8, 1
  ADD r30, r8          ; SP++
  LOAD r7, [r30]       ; NOS
  MUL r9, r7           ; TOS * NOS
  STORE [r30], r9
RET
word_2:
; : COUNTDOWN 
  begin_3:
  LDI r8, 1
  LOAD r8, [r30]       ; DUP: peek TOS
  PUSH r8
  LOAD r8, [r30]       ; pop number
  LDI r7, 1
  ADD r30, r7
  LDI r10, 0xFFB
  STORE r10, r8    ; write to debug port
  LDI r8, 10
  LDI r10, 0xFFB
  STORE r10, r8    ; newline
  LDI r8, 1
  LOAD r7, [r30]
  SUB r7, r8
  STORE [r30], r7
  LDI r8, 1
  LOAD r8, [r30]       ; DUP: peek TOS
  PUSH r8
  LOAD r8, [r30]
  CMPI r8, 0
  JZ r1, zerogt_4_false
  LDI r8, 1
  JMP zerogt_4_done
  zerogt_4_false:
  LDI r8, 0
  zerogt_4_done:
  STORE [r30], r8
  LOAD r8, [r30]       ; pop condition
  LDI r7, 1
  ADD r30, r7
  CMPI r8, 0
  JZ r1, begin_3
  LDI r1, 1
  ADD r30, r1          ; DROP: pop TOS
RET
CALL word_0
; (call HELLO)
; dotquote:  5 squared = 
LDI r8, 32
LDI r10, 0xFFB
STORE r10, r8    ; emit char
LDI r8, 53
LDI r10, 0xFFB
STORE r10, r8    ; emit char
LDI r8, 32
LDI r10, 0xFFB
STORE r10, r8    ; emit char
LDI r8, 115
LDI r10, 0xFFB
STORE r10, r8    ; emit char
LDI r8, 113
LDI r10, 0xFFB
STORE r10, r8    ; emit char
LDI r8, 117
LDI r10, 0xFFB
STORE r10, r8    ; emit char
LDI r8, 97
LDI r10, 0xFFB
STORE r10, r8    ; emit char
LDI r8, 114
LDI r10, 0xFFB
STORE r10, r8    ; emit char
LDI r8, 101
LDI r10, 0xFFB
STORE r10, r8    ; emit char
LDI r8, 100
LDI r10, 0xFFB
STORE r10, r8    ; emit char
LDI r8, 32
LDI r10, 0xFFB
STORE r10, r8    ; emit char
LDI r8, 61
LDI r10, 0xFFB
STORE r10, r8    ; emit char
LDI r8, 32
LDI r10, 0xFFB
STORE r10, r8    ; emit char
LDI r8, 5
PUSH r8
CALL word_1
; (call SQUARE)
LOAD r8, [r30]       ; pop number
LDI r7, 1
ADD r30, r7
LDI r10, 0xFFB
STORE r10, r8    ; write to debug port
LDI r8, 10
LDI r10, 0xFFB
STORE r10, r8    ; newline
; dotquote:  Countdown from 5:
LDI r8, 32
LDI r10, 0xFFB
STORE r10, r8    ; emit char
LDI r8, 67
LDI r10, 0xFFB
STORE r10, r8    ; emit char
LDI r8, 111
LDI r10, 0xFFB
STORE r10, r8    ; emit char
LDI r8, 117
LDI r10, 0xFFB
STORE r10, r8    ; emit char
LDI r8, 110
LDI r10, 0xFFB
STORE r10, r8    ; emit char
LDI r8, 116
LDI r10, 0xFFB
STORE r10, r8    ; emit char
LDI r8, 100
LDI r10, 0xFFB
STORE r10, r8    ; emit char
LDI r8, 111
LDI r10, 0xFFB
STORE r10, r8    ; emit char
LDI r8, 119
LDI r10, 0xFFB
STORE r10, r8    ; emit char
LDI r8, 110
LDI r10, 0xFFB
STORE r10, r8    ; emit char
LDI r8, 32
LDI r10, 0xFFB
STORE r10, r8    ; emit char
LDI r8, 102
LDI r10, 0xFFB
STORE r10, r8    ; emit char
LDI r8, 114
LDI r10, 0xFFB
STORE r10, r8    ; emit char
LDI r8, 111
LDI r10, 0xFFB
STORE r10, r8    ; emit char
LDI r8, 109
LDI r10, 0xFFB
STORE r10, r8    ; emit char
LDI r8, 32
LDI r10, 0xFFB
STORE r10, r8    ; emit char
LDI r8, 53
LDI r10, 0xFFB
STORE r10, r8    ; emit char
LDI r8, 58
LDI r10, 0xFFB
STORE r10, r8    ; emit char
LDI r8, 10
LDI r10, 0xFFB
STORE r10, r8    ; newline
LDI r8, 5
PUSH r8
CALL word_2
; (call COUNTDOWN)
HALT