; DESCRIPTION: Renders a orange line between points (181, 166) and (133, 64).
; PLAN: r0=181(x1), r1=166(y1), r2=133(x2), r3=64(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 166
LDI r2, 133
LDI r3, 64
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
