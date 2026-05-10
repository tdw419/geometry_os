; DESCRIPTION: Renders a yellow line segment connecting (230, 74) to (154, 100).
; PLAN: r0=230(x1), r1=74(y1), r2=154(x2), r3=100(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 74
LDI r2, 154
LDI r3, 100
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
