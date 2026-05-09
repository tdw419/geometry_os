; DESCRIPTION: Draws a yellow line from (148, 43) to (112, 95).
; PLAN: r0=148(x1), r1=43(y1), r2=112(x2), r3=95(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 43
LDI r2, 112
LDI r3, 95
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
