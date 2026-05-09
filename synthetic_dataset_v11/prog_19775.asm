; DESCRIPTION: Renders a yellow line between points (114, 222) and (121, 15).
; PLAN: r0=114(x1), r1=222(y1), r2=121(x2), r3=15(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 222
LDI r2, 121
LDI r3, 15
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
