; DESCRIPTION: Draws a red square at the screen with fixed size.

word_0:
; : HELLO 
  ; dotquote:  Hello from Forth!
  LDI r6, 32
  LDI r14, 0xFFB
  STORE r14, r6    ; emit char
  LDI r6, 72
  LDI r14, 0xFFB
  STORE r14, r6    ; emit char
  LDI r6, 101
  LDI r14, 0xFFB
  STORE r14, r6    ; emit char
  LDI r6, 108
  LDI r14, 0xFFB
  STORE r14, r6    ; emit char
  LDI r6, 108
  LDI r14, 0xFFB
  STORE r14, r6    ; emit char
  LDI r6, 111
  LDI r14, 0xFFB
  STORE r14, r6    ; emit char
  LDI r6, 32
  LDI r14, 0xFFB
  STORE r14, r6    ; emit char
  LDI r6, 102
  LDI r14, 0xFFB
  STORE r14, r6    ; emit char
  LDI r6, 114
  LDI r14, 0xFFB
  STORE r14, r6    ; emit char
  LDI r6, 111
  LDI r14, 0xFFB
  STORE r14, r6    ; emit char
  LDI r6, 109
  LDI r14, 0xFFB
  STORE r14, r6    ; emit char
  LDI r6, 32
  LDI r14, 0xFFB
  STORE r14, r6    ; emit char
  LDI r6, 70
  LDI r14, 0xFFB
  STORE r14, r6    ; emit char
  LDI r6, 111
  LDI r14, 0xFFB
  STORE r14, r6    ; emit char
  LDI r6, 114
  LDI r14, 0xFFB
  STORE r14, r6    ; emit char
  LDI r6, 116
  LDI r14, 0xFFB
  STORE r14, r6    ; emit char
  LDI r6, 104
  LDI r14, 0xFFB
  STORE r14, r6    ; emit char
  LDI r6, 33
  LDI r14, 0xFFB
  STORE r14, r6    ; emit char
  LDI r6, 10
  LDI r14, 0xFFB
  STORE r14, r6    ; newline
RET
word_1:
; : SQUARE 
  LDI r6, 1
  LOAD r6, [r30]       ; DUP: peek TOS
  PUSH r6
  LOAD r0, [r30]       ; TOS
  LDI r6, 1
  ADD r30, r6          ; SP++
  LOAD r11, [r30]       ; NOS
  MUL r0, r11           ; TOS * NOS
  STORE [r30], r0
RET
word_2:
; : COUNTDOWN 
  begin_3:
  LDI r6, 1
  LOAD r6, [r30]       ; DUP: peek TOS
  PUSH r6
  LOAD r6, [r30]       ; pop number
  LDI r11, 1
  ADD r30, r11
  LDI r14, 0xFFB
  STORE r14, r6    ; write to debug port
  LDI r6, 10
  LDI r14, 0xFFB
  STORE r14, r6    ; newline
  LDI r6, 1
  LOAD r11, [r30]
  SUB r11, r6
  STORE [r30], r11
  LDI r6, 1
  LOAD r6, [r30]       ; DUP: peek TOS
  PUSH r6
  LOAD r6, [r30]
  CMPI r6, 0
  JZ r7, zerogt_4_false
  LDI r6, 1
  JMP zerogt_4_done
  zerogt_4_false:
  LDI r6, 0
  zerogt_4_done:
  STORE [r30], r6
  LOAD r6, [r30]       ; pop condition
  LDI r11, 1
  ADD r30, r11
  CMPI r6, 0
  JZ r7, begin_3
  LDI r7, 1
  ADD r30, r7          ; DROP: pop TOS
RET
CALL word_0
; (call HELLO)
; dotquote:  5 squared = 
LDI r6, 32
LDI r14, 0xFFB
STORE r14, r6    ; emit char
LDI r6, 53
LDI r14, 0xFFB
STORE r14, r6    ; emit char
LDI r6, 32
LDI r14, 0xFFB
STORE r14, r6    ; emit char
LDI r6, 115
LDI r14, 0xFFB
STORE r14, r6    ; emit char
LDI r6, 113
LDI r14, 0xFFB
STORE r14, r6    ; emit char
LDI r6, 117
LDI r14, 0xFFB
STORE r14, r6    ; emit char
LDI r6, 97
LDI r14, 0xFFB
STORE r14, r6    ; emit char
LDI r6, 114
LDI r14, 0xFFB
STORE r14, r6    ; emit char
LDI r6, 101
LDI r14, 0xFFB
STORE r14, r6    ; emit char
LDI r6, 100
LDI r14, 0xFFB
STORE r14, r6    ; emit char
LDI r6, 32
LDI r14, 0xFFB
STORE r14, r6    ; emit char
LDI r6, 61
LDI r14, 0xFFB
STORE r14, r6    ; emit char
LDI r6, 32
LDI r14, 0xFFB
STORE r14, r6    ; emit char
LDI r6, 5
PUSH r6
CALL word_1
; (call SQUARE)
LOAD r6, [r30]       ; pop number
LDI r11, 1
ADD r30, r11
LDI r14, 0xFFB
STORE r14, r6    ; write to debug port
LDI r6, 10
LDI r14, 0xFFB
STORE r14, r6    ; newline
; dotquote:  Countdown from 5:
LDI r6, 32
LDI r14, 0xFFB
STORE r14, r6    ; emit char
LDI r6, 67
LDI r14, 0xFFB
STORE r14, r6    ; emit char
LDI r6, 111
LDI r14, 0xFFB
STORE r14, r6    ; emit char
LDI r6, 117
LDI r14, 0xFFB
STORE r14, r6    ; emit char
LDI r6, 110
LDI r14, 0xFFB
STORE r14, r6    ; emit char
LDI r6, 116
LDI r14, 0xFFB
STORE r14, r6    ; emit char
LDI r6, 100
LDI r14, 0xFFB
STORE r14, r6    ; emit char
LDI r6, 111
LDI r14, 0xFFB
STORE r14, r6    ; emit char
LDI r6, 119
LDI r14, 0xFFB
STORE r14, r6    ; emit char
LDI r6, 110
LDI r14, 0xFFB
STORE r14, r6    ; emit char
LDI r6, 32
LDI r14, 0xFFB
STORE r14, r6    ; emit char
LDI r6, 102
LDI r14, 0xFFB
STORE r14, r6    ; emit char
LDI r6, 114
LDI r14, 0xFFB
STORE r14, r6    ; emit char
LDI r6, 111
LDI r14, 0xFFB
STORE r14, r6    ; emit char
LDI r6, 109
LDI r14, 0xFFB
STORE r14, r6    ; emit char
LDI r6, 32
LDI r14, 0xFFB
STORE r14, r6    ; emit char
LDI r6, 53
LDI r14, 0xFFB
STORE r14, r6    ; emit char
LDI r6, 58
LDI r14, 0xFFB
STORE r14, r6    ; emit char
LDI r6, 10
LDI r14, 0xFFB
STORE r14, r6    ; newline
LDI r6, 5
PUSH r6
CALL word_2
; (call COUNTDOWN)
HALT