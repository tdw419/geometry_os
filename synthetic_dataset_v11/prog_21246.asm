; DESCRIPTION: Renders a yellow line between points (101, 20) and (153, 131).
; PLAN: r0=101(x1), r1=20(y1), r2=153(x2), r3=131(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 20
LDI r2, 153
LDI r3, 131
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
