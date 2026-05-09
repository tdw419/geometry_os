; DESCRIPTION: Renders a white line between points (118, 105) and (167, 49).
; PLAN: r0=118(x1), r1=105(y1), r2=167(x2), r3=49(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 105
LDI r2, 167
LDI r3, 49
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
