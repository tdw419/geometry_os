; DESCRIPTION: Renders a green line between points (416, 227) and (203, 35).
; PLAN: r0=416(x1), r1=227(y1), r2=203(x2), r3=35(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 227
LDI r2, 203
LDI r3, 35
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
