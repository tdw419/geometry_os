; DESCRIPTION: Renders a white line between points (496, 247) and (112, 253).
; PLAN: r0=496(x1), r1=247(y1), r2=112(x2), r3=253(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 247
LDI r2, 112
LDI r3, 253
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
