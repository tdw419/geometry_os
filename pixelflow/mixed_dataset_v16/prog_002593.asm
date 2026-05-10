; DESCRIPTION: Renders a green line between points (101, 139) and (270, 100).
; PLAN: r0=101(x1), r1=139(y1), r2=270(x2), r3=100(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 139
LDI r2, 270
LDI r3, 100
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
