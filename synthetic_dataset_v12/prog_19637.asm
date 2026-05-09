; DESCRIPTION: Renders a orange line between points (286, 225) and (190, 253).
; PLAN: r0=286(x1), r1=225(y1), r2=190(x2), r3=253(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 225
LDI r2, 190
LDI r3, 253
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
