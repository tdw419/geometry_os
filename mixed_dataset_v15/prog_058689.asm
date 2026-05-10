; DESCRIPTION: Renders a yellow line between points (496, 241) and (104, 174).
; PLAN: r0=496(x1), r1=241(y1), r2=104(x2), r3=174(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 241
LDI r2, 104
LDI r3, 174
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
