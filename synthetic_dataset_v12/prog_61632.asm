; DESCRIPTION: Renders a yellow line between points (20, 112) and (69, 139).
; PLAN: r0=20(x1), r1=112(y1), r2=69(x2), r3=139(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 112
LDI r2, 69
LDI r3, 139
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
