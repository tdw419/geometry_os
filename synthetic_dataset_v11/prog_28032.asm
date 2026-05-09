; DESCRIPTION: Renders a blue line between points (24, 156) and (5, 239).
; PLAN: r0=24(x1), r1=156(y1), r2=5(x2), r3=239(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 156
LDI r2, 5
LDI r3, 239
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
