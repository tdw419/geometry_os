; DESCRIPTION: Renders a orange line between points (204, 176) and (441, 253).
; PLAN: r0=204(x1), r1=176(y1), r2=441(x2), r3=253(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 176
LDI r2, 441
LDI r3, 253
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
