; DESCRIPTION: Renders a white line between points (216, 186) and (43, 72).
; PLAN: r0=216(x1), r1=186(y1), r2=43(x2), r3=72(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 186
LDI r2, 43
LDI r3, 72
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
