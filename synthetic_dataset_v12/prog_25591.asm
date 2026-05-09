; DESCRIPTION: Renders a black line between points (148, 166) and (302, 245).
; PLAN: r0=148(x1), r1=166(y1), r2=302(x2), r3=245(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 166
LDI r2, 302
LDI r3, 245
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
