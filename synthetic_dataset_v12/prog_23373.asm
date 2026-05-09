; DESCRIPTION: Draws a orange line from (306, 224) to (155, 253).
; PLAN: r0=306(x1), r1=224(y1), r2=155(x2), r3=253(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 224
LDI r2, 155
LDI r3, 253
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
