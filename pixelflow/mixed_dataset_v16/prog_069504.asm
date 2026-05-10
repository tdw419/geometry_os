; DESCRIPTION: Places a orange line segment connecting (308, 64) to (92, 10).
; PLAN: r0=308(x1), r1=64(y1), r2=92(x2), r3=10(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 64
LDI r2, 92
LDI r3, 10
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
