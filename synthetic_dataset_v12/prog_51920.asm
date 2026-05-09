; DESCRIPTION: Renders a orange line between points (313, 58) and (494, 81).
; PLAN: r0=313(x1), r1=58(y1), r2=494(x2), r3=81(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 58
LDI r2, 494
LDI r3, 81
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
