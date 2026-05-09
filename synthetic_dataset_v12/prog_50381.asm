; DESCRIPTION: Renders a white line between points (496, 51) and (114, 40).
; PLAN: r0=496(x1), r1=51(y1), r2=114(x2), r3=40(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 51
LDI r2, 114
LDI r3, 40
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
