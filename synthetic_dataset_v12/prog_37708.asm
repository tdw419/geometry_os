; DESCRIPTION: Draws a orange line from (496, 175) to (303, 254).
; PLAN: r0=496(x1), r1=175(y1), r2=303(x2), r3=254(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 175
LDI r2, 303
LDI r3, 254
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
