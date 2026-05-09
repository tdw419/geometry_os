; DESCRIPTION: Renders a orange line between points (128, 19) and (268, 63).
; PLAN: r0=128(x1), r1=19(y1), r2=268(x2), r3=63(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 19
LDI r2, 268
LDI r3, 63
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
