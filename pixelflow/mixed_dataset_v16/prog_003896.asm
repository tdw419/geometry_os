; DESCRIPTION: Renders a yellow line between points (315, 9) and (85, 24).
; PLAN: r0=315(x1), r1=9(y1), r2=85(x2), r3=24(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 9
LDI r2, 85
LDI r3, 24
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
