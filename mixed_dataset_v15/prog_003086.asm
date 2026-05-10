; DESCRIPTION: Renders a blue line segment connecting (208, 20) to (27, 93).
; PLAN: r0=208(x1), r1=20(y1), r2=27(x2), r3=93(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 20
LDI r2, 27
LDI r3, 93
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
