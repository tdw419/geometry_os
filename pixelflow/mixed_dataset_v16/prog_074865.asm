; DESCRIPTION: Draws a blue line from (331, 154) to (325, 160).
; PLAN: r0=331(x1), r1=154(y1), r2=325(x2), r3=160(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 154
LDI r2, 325
LDI r3, 160
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
