; DESCRIPTION: Renders a orange line between points (455, 253) and (233, 142).
; PLAN: r0=455(x1), r1=253(y1), r2=233(x2), r3=142(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 253
LDI r2, 233
LDI r3, 142
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
