; DESCRIPTION: Renders a blue line between points (491, 0) and (122, 150).
; PLAN: r0=491(x1), r1=0(y1), r2=122(x2), r3=150(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 0
LDI r2, 122
LDI r3, 150
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
