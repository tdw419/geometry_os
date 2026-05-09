; DESCRIPTION: Renders a white line between points (77, 118) and (230, 167).
; PLAN: r0=77(x1), r1=118(y1), r2=230(x2), r3=167(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 118
LDI r2, 230
LDI r3, 167
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
