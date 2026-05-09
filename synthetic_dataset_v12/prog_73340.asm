; DESCRIPTION: Renders a blue line between points (52, 130) and (111, 100).
; PLAN: r0=52(x1), r1=130(y1), r2=111(x2), r3=100(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 130
LDI r2, 111
LDI r3, 100
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
