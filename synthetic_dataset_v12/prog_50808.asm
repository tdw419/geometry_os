; DESCRIPTION: Renders a yellow line between points (64, 30) and (114, 121).
; PLAN: r0=64(x1), r1=30(y1), r2=114(x2), r3=121(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 30
LDI r2, 114
LDI r3, 121
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
