; DESCRIPTION: Renders a white line between points (96, 11) and (37, 232).
; PLAN: r0=96(x1), r1=11(y1), r2=37(x2), r3=232(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 11
LDI r2, 37
LDI r3, 232
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
