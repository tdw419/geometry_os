; DESCRIPTION: Renders a blue line segment connecting (13, 39) to (269, 18).
; PLAN: r0=13(x1), r1=39(y1), r2=269(x2), r3=18(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 39
LDI r2, 269
LDI r3, 18
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
