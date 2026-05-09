; DESCRIPTION: Renders a orange line between points (269, 52) and (74, 127).
; PLAN: r0=269(x1), r1=52(y1), r2=74(x2), r3=127(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 52
LDI r2, 74
LDI r3, 127
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
