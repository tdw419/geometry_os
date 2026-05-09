; DESCRIPTION: Renders a orange line between points (258, 43) and (363, 247).
; PLAN: r0=258(x1), r1=43(y1), r2=363(x2), r3=247(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 43
LDI r2, 363
LDI r3, 247
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
