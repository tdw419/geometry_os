; DESCRIPTION: Draws a black line from (95, 54) to (302, 194).
; PLAN: r0=95(x1), r1=54(y1), r2=302(x2), r3=194(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 54
LDI r2, 302
LDI r3, 194
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
