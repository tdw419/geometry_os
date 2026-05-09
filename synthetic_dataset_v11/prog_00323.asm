; DESCRIPTION: Renders a white line between points (74, 60) and (105, 232).
; PLAN: r0=74(x1), r1=60(y1), r2=105(x2), r3=232(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 60
LDI r2, 105
LDI r3, 232
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
