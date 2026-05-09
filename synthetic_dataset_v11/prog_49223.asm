; DESCRIPTION: Renders a yellow line between points (249, 139) and (102, 20).
; PLAN: r0=249(x1), r1=139(y1), r2=102(x2), r3=20(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 139
LDI r2, 102
LDI r3, 20
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
