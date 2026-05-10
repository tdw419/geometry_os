; DESCRIPTION: Draws a magenta line from (330, 222) to (390, 248).
; PLAN: r0=330(x1), r1=222(y1), r2=390(x2), r3=248(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 222
LDI r2, 390
LDI r3, 248
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
