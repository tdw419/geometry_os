; DESCRIPTION: Renders a orange line between points (416, 209) and (201, 176).
; PLAN: r0=416(x1), r1=209(y1), r2=201(x2), r3=176(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 209
LDI r2, 201
LDI r3, 176
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
