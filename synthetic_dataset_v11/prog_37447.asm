; DESCRIPTION: Renders a white line between points (182, 160) and (136, 140).
; PLAN: r0=182(x1), r1=160(y1), r2=136(x2), r3=140(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 160
LDI r2, 136
LDI r3, 140
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
