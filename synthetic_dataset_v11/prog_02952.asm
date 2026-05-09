; DESCRIPTION: Renders a orange line between points (144, 36) and (77, 253).
; PLAN: r0=144(x1), r1=36(y1), r2=77(x2), r3=253(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 36
LDI r2, 77
LDI r3, 253
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
