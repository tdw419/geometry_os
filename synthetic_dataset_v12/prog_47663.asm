; DESCRIPTION: Renders a yellow line between points (119, 21) and (13, 153).
; PLAN: r0=119(x1), r1=21(y1), r2=13(x2), r3=153(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 21
LDI r2, 13
LDI r3, 153
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
