; DESCRIPTION: Places a blue line segment connecting (154, 185) to (7, 232).
; PLAN: r0=154(x1), r1=185(y1), r2=7(x2), r3=232(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 185
LDI r2, 7
LDI r3, 232
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
