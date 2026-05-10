; DESCRIPTION: Places a orange line segment connecting (268, 64) to (36, 50).
; PLAN: r0=268(x1), r1=64(y1), r2=36(x2), r3=50(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 64
LDI r2, 36
LDI r3, 50
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
