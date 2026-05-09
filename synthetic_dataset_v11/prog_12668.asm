; DESCRIPTION: Renders a white line between points (49, 193) and (65, 118).
; PLAN: r0=49(x1), r1=193(y1), r2=65(x2), r3=118(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 193
LDI r2, 65
LDI r3, 118
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
