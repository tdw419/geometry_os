; DESCRIPTION: Renders a blue line between points (33, 72) and (332, 1).
; PLAN: r0=33(x1), r1=72(y1), r2=332(x2), r3=1(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 72
LDI r2, 332
LDI r3, 1
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
