; DESCRIPTION: Renders a white line between points (318, 122) and (200, 226).
; PLAN: r0=318(x1), r1=122(y1), r2=200(x2), r3=226(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 122
LDI r2, 200
LDI r3, 226
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
