; DESCRIPTION: Renders a red line between points (127, 94) and (31, 78).
; PLAN: r0=127(x1), r1=94(y1), r2=31(x2), r3=78(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 94
LDI r2, 31
LDI r3, 78
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
