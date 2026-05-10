; DESCRIPTION: Draws a purple line from (455, 234) to (409, 16).
; PLAN: r0=455(x1), r1=234(y1), r2=409(x2), r3=16(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 234
LDI r2, 409
LDI r3, 16
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
