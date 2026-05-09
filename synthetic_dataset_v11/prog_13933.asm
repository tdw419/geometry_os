; DESCRIPTION: Renders a yellow line between points (205, 142) and (85, 36).
; PLAN: r0=205(x1), r1=142(y1), r2=85(x2), r3=36(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 142
LDI r2, 85
LDI r3, 36
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
