; DESCRIPTION: Renders a white line between points (279, 146) and (155, 36).
; PLAN: r0=279(x1), r1=146(y1), r2=155(x2), r3=36(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 146
LDI r2, 155
LDI r3, 36
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
