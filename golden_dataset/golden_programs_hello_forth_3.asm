; DESCRIPTION: This GeOS assembly code defines three words: `HELLO`, `SQUARE`, and `COUNTDOWN`. The `HELLO` word outputs "Hello from Forth!" to the debug port. The `SQUARE` word calculates the square of a number provided on the stack. The `COUNTDOWN` word prints numbers from the given starting point down to 1, with each number followed by a newline. The main execution flow calls `HELLO`, then prints "5 squared = ", computes the square of 5 using `SQUARE`, and finally counts down from 5 using `COUNTDOWN`.

word_0:
; : HELLO 
  ; dotquote:  Hello from Forth!
  LDI r11, 32
  LDI r4, 0xFFB
  STORE r4, r11    ; emit char
  LDI r11, 72
  LDI r4, 0xFFB
  STORE r4, r11    ; emit char
  LDI r11, 101
  LDI r4, 0xFFB
  STORE r4, r11    ; emit char
  LDI r11, 108
  LDI r4, 0xFFB
  STORE r4, r11    ; emit char
  LDI r11, 108
  LDI r4, 0xFFB
  STORE r4, r11    ; emit char
  LDI r11, 111
  LDI r4, 0xFFB
  STORE r4, r11    ; emit char
  LDI r11, 32
  LDI r4, 0xFFB
  STORE r4, r11    ; emit char
  LDI r11, 102
  LDI r4, 0xFFB
  STORE r4, r11    ; emit char
  LDI r11, 114
  LDI r4, 0xFFB
  STORE r4, r11    ; emit char
  LDI r11, 111
  LDI r4, 0xFFB
  STORE r4, r11    ; emit char
  LDI r11, 109
  LDI r4, 0xFFB
  STORE r4, r11    ; emit char
  LDI r11, 32
  LDI r4, 0xFFB
  STORE r4, r11    ; emit char
  LDI r11, 70
  LDI r4, 0xFFB
  STORE r4, r11    ; emit char
  LDI r11, 111
  LDI r4, 0xFFB
  STORE r4, r11    ; emit char
  LDI r11, 114
  LDI r4, 0xFFB
  STORE r4, r11    ; emit char
  LDI r11, 116
  LDI r4, 0xFFB
  STORE r4, r11    ; emit char
  LDI r11, 104
  LDI r4, 0xFFB
  STORE r4, r11    ; emit char
  LDI r11, 33
  LDI r4, 0xFFB
  STORE r4, r11    ; emit char
  LDI r11, 10
  LDI r4, 0xFFB
  STORE r4, r11    ; newline
RET
word_1:
; : SQUARE 
  LDI r11, 1
  LOAD r11, [r30]       ; DUP: peek TOS
  PUSH r11
  LOAD r2, [r30]       ; TOS
  LDI r11, 1
  ADD r30, r11          ; SP++
  LOAD r9, [r30]       ; NOS
  MUL r2, r9           ; TOS * NOS
  STORE [r30], r2
RET
word_2:
; : COUNTDOWN 
  begin_3:
  LDI r11, 1
  LOAD r11, [r30]       ; DUP: peek TOS
  PUSH r11
  LOAD r11, [r30]       ; pop number
  LDI r9, 1
  ADD r30, r9
  LDI r4, 0xFFB
  STORE r4, r11    ; write to debug port
  LDI r11, 10
  LDI r4, 0xFFB
  STORE r4, r11    ; newline
  LDI r11, 1
  LOAD r9, [r30]
  SUB r9, r11
  STORE [r30], r9
  LDI r11, 1
  LOAD r11, [r30]       ; DUP: peek TOS
  PUSH r11
  LOAD r11, [r30]
  CMPI r11, 0
  JZ r1, zerogt_4_false
  LDI r11, 1
  JMP zerogt_4_done
  zerogt_4_false:
  LDI r11, 0
  zerogt_4_done:
  STORE [r30], r11
  LOAD r11, [r30]       ; pop condition
  LDI r9, 1
  ADD r30, r9
  CMPI r11, 0
  JZ r1, begin_3
  LDI r1, 1
  ADD r30, r1          ; DROP: pop TOS
RET
CALL word_0
; (call HELLO)
; dotquote:  5 squared = 
LDI r11, 32
LDI r4, 0xFFB
STORE r4, r11    ; emit char
LDI r11, 53
LDI r4, 0xFFB
STORE r4, r11    ; emit char
LDI r11, 32
LDI r4, 0xFFB
STORE r4, r11    ; emit char
LDI r11, 115
LDI r4, 0xFFB
STORE r4, r11    ; emit char
LDI r11, 113
LDI r4, 0xFFB
STORE r4, r11    ; emit char
LDI r11, 117
LDI r4, 0xFFB
STORE r4, r11    ; emit char
LDI r11, 97
LDI r4, 0xFFB
STORE r4, r11    ; emit char
LDI r11, 114
LDI r4, 0xFFB
STORE r4, r11    ; emit char
LDI r11, 101
LDI r4, 0xFFB
STORE r4, r11    ; emit char
LDI r11, 100
LDI r4, 0xFFB
STORE r4, r11    ; emit char
LDI r11, 32
LDI r4, 0xFFB
STORE r4, r11    ; emit char
LDI r11, 61
LDI r4, 0xFFB
STORE r4, r11    ; emit char
LDI r11, 32
LDI r4, 0xFFB
STORE r4, r11    ; emit char
LDI r11, 5
PUSH r11
CALL word_1
; (call SQUARE)
LOAD r11, [r30]       ; pop number
LDI r9, 1
ADD r30, r9
LDI r4, 0xFFB
STORE r4, r11    ; write to debug port
LDI r11, 10
LDI r4, 0xFFB
STORE r4, r11    ; newline
; dotquote:  Countdown from 5:
LDI r11, 32
LDI r4, 0xFFB
STORE r4, r11    ; emit char
LDI r11, 67
LDI r4, 0xFFB
STORE r4, r11    ; emit char
LDI r11, 111
LDI r4, 0xFFB
STORE r4, r11    ; emit char
LDI r11, 117
LDI r4, 0xFFB
STORE r4, r11    ; emit char
LDI r11, 110
LDI r4, 0xFFB
STORE r4, r11    ; emit char
LDI r11, 116
LDI r4, 0xFFB
STORE r4, r11    ; emit char
LDI r11, 100
LDI r4, 0xFFB
STORE r4, r11    ; emit char
LDI r11, 111
LDI r4, 0xFFB
STORE r4, r11    ; emit char
LDI r11, 119
LDI r4, 0xFFB
STORE r4, r11    ; emit char
LDI r11, 110
LDI r4, 0xFFB
STORE r4, r11    ; emit char
LDI r11, 32
LDI r4, 0xFFB
STORE r4, r11    ; emit char
LDI r11, 102
LDI r4, 0xFFB
STORE r4, r11    ; emit char
LDI r11, 114
LDI r4, 0xFFB
STORE r4, r11    ; emit char
LDI r11, 111
LDI r4, 0xFFB
STORE r4, r11    ; emit char
LDI r11, 109
LDI r4, 0xFFB
STORE r4, r11    ; emit char
LDI r11, 32
LDI r4, 0xFFB
STORE r4, r11    ; emit char
LDI r11, 53
LDI r4, 0xFFB
STORE r4, r11    ; emit char
LDI r11, 58
LDI r4, 0xFFB
STORE r4, r11    ; emit char
LDI r11, 10
LDI r4, 0xFFB
STORE r4, r11    ; newline
LDI r11, 5
PUSH r11
CALL word_2
; (call COUNTDOWN)
HALT