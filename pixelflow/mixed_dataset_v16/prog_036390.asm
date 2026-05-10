; DESCRIPTION: Renders a white line between points (227, 122) and (136, 55).
; PLAN: r0=227(x1), r1=122(y1), r2=136(x2), r3=55(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 122
LDI r2, 136
LDI r3, 55
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
