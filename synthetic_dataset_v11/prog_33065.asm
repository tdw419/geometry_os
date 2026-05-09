; DESCRIPTION: Places a purple line segment connecting (161, 154) to (134, 234).
; PLAN: r0=161(x1), r1=154(y1), r2=134(x2), r3=234(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 154
LDI r2, 134
LDI r3, 234
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
