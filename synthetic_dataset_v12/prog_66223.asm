; DESCRIPTION: Renders a orange line between points (128, 251) and (109, 219).
; PLAN: r0=128(x1), r1=251(y1), r2=109(x2), r3=219(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 251
LDI r2, 109
LDI r3, 219
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
