; DESCRIPTION: Renders a blue line segment connecting (343, 3) to (271, 108).
; PLAN: r0=343(x1), r1=3(y1), r2=271(x2), r3=108(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 3
LDI r2, 271
LDI r3, 108
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
