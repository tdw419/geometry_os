; DESCRIPTION: Renders a orange line between points (81, 11) and (128, 113).
; PLAN: r0=81(x1), r1=11(y1), r2=128(x2), r3=113(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 11
LDI r2, 128
LDI r3, 113
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
