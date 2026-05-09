; DESCRIPTION: Places a blue line segment connecting (212, 201) to (214, 161).
; PLAN: r0=212(x1), r1=201(y1), r2=214(x2), r3=161(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 201
LDI r2, 214
LDI r3, 161
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
