; DESCRIPTION: A red square centered at the screen with fixed size.

word_0:
; : HELLO 
  ; dotquote:  Hello from Forth!
  LDI r4, 32
  LDI r11, 0xFFB
  STORE r11, r4    ; emit char
  LDI r4, 72
  LDI r11, 0xFFB
  STORE r11, r4    ; emit char
  LDI r4, 101
  LDI r11, 0xFFB
  STORE r11, r4    ; emit char
  LDI r4, 108
  LDI r11, 0xFFB
  STORE r11, r4    ; emit char
  LDI r4, 108
  LDI r11, 0xFFB
  STORE r11, r4    ; emit char
  LDI r4, 111
  LDI r11, 0xFFB
  STORE r11, r4    ; emit char
  LDI r4, 32
  LDI r11, 0xFFB
  STORE r11, r4    ; emit char
  LDI r4, 102
  LDI r11, 0xFFB
  STORE r11, r4    ; emit char
  LDI r4, 114
  LDI r11, 0xFFB
  STORE r11, r4    ; emit char
  LDI r4, 111
  LDI r11, 0xFFB
  STORE r11, r4    ; emit char
  LDI r4, 109
  LDI r11, 0xFFB
  STORE r11, r4    ; emit char
  LDI r4, 32
  LDI r11, 0xFFB
  STORE r11, r4    ; emit char
  LDI r4, 70
  LDI r11, 0xFFB
  STORE r11, r4    ; emit char
  LDI r4, 111
  LDI r11, 0xFFB
  STORE r11, r4    ; emit char
  LDI r4, 114
  LDI r11, 0xFFB
  STORE r11, r4    ; emit char
  LDI r4, 116
  LDI r11, 0xFFB
  STORE r11, r4    ; emit char
  LDI r4, 104
  LDI r11, 0xFFB
  STORE r11, r4    ; emit char
  LDI r4, 33
  LDI r11, 0xFFB
  STORE r11, r4    ; emit char
  LDI r4, 10
  LDI r11, 0xFFB
  STORE r11, r4    ; newline
RET
word_1:
; : SQUARE 
  LDI r4, 1
  LOAD r4, [r30]       ; DUP: peek TOS
  PUSH r4
  LOAD r7, [r30]       ; TOS
  LDI r4, 1
  ADD r30, r4          ; SP++
  LOAD r6, [r30]       ; NOS
  MUL r7, r6           ; TOS * NOS
  STORE [r30], r7
RET
word_2:
; : COUNTDOWN 
  begin_3:
  LDI r4, 1
  LOAD r4, [r30]       ; DUP: peek TOS
  PUSH r4
  LOAD r4, [r30]       ; pop number
  LDI r6, 1
  ADD r30, r6
  LDI r11, 0xFFB
  STORE r11, r4    ; write to debug port
  LDI r4, 10
  LDI r11, 0xFFB
  STORE r11, r4    ; newline
  LDI r4, 1
  LOAD r6, [r30]
  SUB r6, r4
  STORE [r30], r6
  LDI r4, 1
  LOAD r4, [r30]       ; DUP: peek TOS
  PUSH r4
  LOAD r4, [r30]
  CMPI r4, 0
  JZ r8, zerogt_4_false
  LDI r4, 1
  JMP zerogt_4_done
  zerogt_4_false:
  LDI r4, 0
  zerogt_4_done:
  STORE [r30], r4
  LOAD r4, [r30]       ; pop condition
  LDI r6, 1
  ADD r30, r6
  CMPI r4, 0
  JZ r8, begin_3
  LDI r8, 1
  ADD r30, r8          ; DROP: pop TOS
RET
CALL word_0
; (call HELLO)
; dotquote:  5 squared = 
LDI r4, 32
LDI r11, 0xFFB
STORE r11, r4    ; emit char
LDI r4, 53
LDI r11, 0xFFB
STORE r11, r4    ; emit char
LDI r4, 32
LDI r11, 0xFFB
STORE r11, r4    ; emit char
LDI r4, 115
LDI r11, 0xFFB
STORE r11, r4    ; emit char
LDI r4, 113
LDI r11, 0xFFB
STORE r11, r4    ; emit char
LDI r4, 117
LDI r11, 0xFFB
STORE r11, r4    ; emit char
LDI r4, 97
LDI r11, 0xFFB
STORE r11, r4    ; emit char
LDI r4, 114
LDI r11, 0xFFB
STORE r11, r4    ; emit char
LDI r4, 101
LDI r11, 0xFFB
STORE r11, r4    ; emit char
LDI r4, 100
LDI r11, 0xFFB
STORE r11, r4    ; emit char
LDI r4, 32
LDI r11, 0xFFB
STORE r11, r4    ; emit char
LDI r4, 61
LDI r11, 0xFFB
STORE r11, r4    ; emit char
LDI r4, 32
LDI r11, 0xFFB
STORE r11, r4    ; emit char
LDI r4, 5
PUSH r4
CALL word_1
; (call SQUARE)
LOAD r4, [r30]       ; pop number
LDI r6, 1
ADD r30, r6
LDI r11, 0xFFB
STORE r11, r4    ; write to debug port
LDI r4, 10
LDI r11, 0xFFB
STORE r11, r4    ; newline
; dotquote:  Countdown from 5:
LDI r4, 32
LDI r11, 0xFFB
STORE r11, r4    ; emit char
LDI r4, 67
LDI r11, 0xFFB
STORE r11, r4    ; emit char
LDI r4, 111
LDI r11, 0xFFB
STORE r11, r4    ; emit char
LDI r4, 117
LDI r11, 0xFFB
STORE r11, r4    ; emit char
LDI r4, 110
LDI r11, 0xFFB
STORE r11, r4    ; emit char
LDI r4, 116
LDI r11, 0xFFB
STORE r11, r4    ; emit char
LDI r4, 100
LDI r11, 0xFFB
STORE r11, r4    ; emit char
LDI r4, 111
LDI r11, 0xFFB
STORE r11, r4    ; emit char
LDI r4, 119
LDI r11, 0xFFB
STORE r11, r4    ; emit char
LDI r4, 110
LDI r11, 0xFFB
STORE r11, r4    ; emit char
LDI r4, 32
LDI r11, 0xFFB
STORE r11, r4    ; emit char
LDI r4, 102
LDI r11, 0xFFB
STORE r11, r4    ; emit char
LDI r4, 114
LDI r11, 0xFFB
STORE r11, r4    ; emit char
LDI r4, 111
LDI r11, 0xFFB
STORE r11, r4    ; emit char
LDI r4, 109
LDI r11, 0xFFB
STORE r11, r4    ; emit char
LDI r4, 32
LDI r11, 0xFFB
STORE r11, r4    ; emit char
LDI r4, 53
LDI r11, 0xFFB
STORE r11, r4    ; emit char
LDI r4, 58
LDI r11, 0xFFB
STORE r11, r4    ; emit char
LDI r4, 10
LDI r11, 0xFFB
STORE r11, r4    ; newline
LDI r4, 5
PUSH r4
CALL word_2
; (call COUNTDOWN)
HALT