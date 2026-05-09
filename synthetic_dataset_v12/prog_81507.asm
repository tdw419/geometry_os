; DESCRIPTION: Renders a orange line between points (39, 7) and (376, 128).
; PLAN: r0=39(x1), r1=7(y1), r2=376(x2), r3=128(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 7
LDI r2, 376
LDI r3, 128
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
