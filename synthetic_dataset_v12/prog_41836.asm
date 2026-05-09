; DESCRIPTION: Renders a blue line between points (122, 20) and (299, 196).
; PLAN: r0=122(x1), r1=20(y1), r2=299(x2), r3=196(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 20
LDI r2, 299
LDI r3, 196
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
