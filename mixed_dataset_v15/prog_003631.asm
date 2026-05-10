; DESCRIPTION: Renders a blue line segment connecting (30, 196) to (49, 168).
; PLAN: r0=30(x1), r1=196(y1), r2=49(x2), r3=168(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 196
LDI r2, 49
LDI r3, 168
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
