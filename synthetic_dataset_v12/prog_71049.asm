; DESCRIPTION: Places a orange line segment connecting (4, 5) to (268, 128).
; PLAN: r0=4(x1), r1=5(y1), r2=268(x2), r3=128(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 5
LDI r2, 268
LDI r3, 128
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
