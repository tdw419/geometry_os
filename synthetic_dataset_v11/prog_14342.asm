; DESCRIPTION: Renders a white line between points (155, 64) and (170, 90).
; PLAN: r0=155(x1), r1=64(y1), r2=170(x2), r3=90(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 64
LDI r2, 170
LDI r3, 90
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
