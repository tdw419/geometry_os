; DESCRIPTION: Draws a black line from (141, 59) to (125, 245).
; PLAN: r0=141(x1), r1=59(y1), r2=125(x2), r3=245(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 59
LDI r2, 125
LDI r3, 245
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
