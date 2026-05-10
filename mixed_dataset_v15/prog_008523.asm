; DESCRIPTION: Draws a yellow line from (310, 183) to (1, 55).
; PLAN: r0=310(x1), r1=183(y1), r2=1(x2), r3=55(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 183
LDI r2, 1
LDI r3, 55
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
