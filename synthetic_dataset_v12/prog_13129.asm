; DESCRIPTION: Renders a red line between points (451, 254) and (207, 227).
; PLAN: r0=451(x1), r1=254(y1), r2=207(x2), r3=227(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 254
LDI r2, 207
LDI r3, 227
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
