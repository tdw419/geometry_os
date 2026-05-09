; DESCRIPTION: Places a purple line segment connecting (154, 236) to (164, 123).
; PLAN: r0=154(x1), r1=236(y1), r2=164(x2), r3=123(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 236
LDI r2, 164
LDI r3, 123
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
