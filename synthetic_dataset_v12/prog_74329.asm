; DESCRIPTION: Places a orange line segment connecting (471, 42) to (333, 128).
; PLAN: r0=471(x1), r1=42(y1), r2=333(x2), r3=128(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 42
LDI r2, 333
LDI r3, 128
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
