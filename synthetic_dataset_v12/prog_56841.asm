; DESCRIPTION: Renders a white line between points (182, 243) and (136, 106).
; PLAN: r0=182(x1), r1=243(y1), r2=136(x2), r3=106(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 243
LDI r2, 136
LDI r3, 106
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
