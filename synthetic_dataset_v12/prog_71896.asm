; DESCRIPTION: Renders a yellow line between points (31, 114) and (496, 33).
; PLAN: r0=31(x1), r1=114(y1), r2=496(x2), r3=33(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 114
LDI r2, 496
LDI r3, 33
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
