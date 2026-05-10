; DESCRIPTION: Renders a orange line between points (321, 253) and (312, 177).
; PLAN: r0=321(x1), r1=253(y1), r2=312(x2), r3=177(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 253
LDI r2, 312
LDI r3, 177
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
