; DESCRIPTION: Renders a yellow line between points (101, 225) and (97, 153).
; PLAN: r0=101(x1), r1=225(y1), r2=97(x2), r3=153(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 225
LDI r2, 97
LDI r3, 153
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
