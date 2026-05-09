; DESCRIPTION: Renders a white line between points (62, 14) and (253, 43).
; PLAN: r0=62(x1), r1=14(y1), r2=253(x2), r3=43(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 14
LDI r2, 253
LDI r3, 43
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
