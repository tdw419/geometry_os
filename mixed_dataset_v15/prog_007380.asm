; DESCRIPTION: Places a blue line segment connecting (3, 36) to (214, 61).
; PLAN: r0=3(x1), r1=36(y1), r2=214(x2), r3=61(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 36
LDI r2, 214
LDI r3, 61
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
