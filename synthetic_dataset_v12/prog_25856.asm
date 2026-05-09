; DESCRIPTION: Draws a black line from (29, 103) to (318, 102).
; PLAN: r0=29(x1), r1=103(y1), r2=318(x2), r3=102(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 103
LDI r2, 318
LDI r3, 102
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
