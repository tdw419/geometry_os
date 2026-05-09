; DESCRIPTION: Places a black line segment connecting (214, 150) to (134, 36).
; PLAN: r0=214(x1), r1=150(y1), r2=134(x2), r3=36(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 150
LDI r2, 134
LDI r3, 36
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
