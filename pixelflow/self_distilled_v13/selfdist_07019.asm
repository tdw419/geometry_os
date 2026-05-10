; DESCRIPTION: Renders a blue line segment connecting (27, 99) to (124, 14).
; PLAN: r0=27(x1), r1=99(y1), r2=124(x2), r3=14(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 99
LDI r2, 124
LDI r3, 14
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
