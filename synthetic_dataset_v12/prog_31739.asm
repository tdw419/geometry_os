; DESCRIPTION: Draws a black line from (283, 43) to (95, 53).
; PLAN: r0=283(x1), r1=43(y1), r2=95(x2), r3=53(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 43
LDI r2, 95
LDI r3, 53
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
