; DESCRIPTION: Renders a green line segment connecting (78, 51) to (1, 165).
; PLAN: r0=78(x1), r1=51(y1), r2=1(x2), r3=165(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 51
LDI r2, 1
LDI r3, 165
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
