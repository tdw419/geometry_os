; DESCRIPTION: Renders a blue line between points (17, 103) and (11, 252).
; PLAN: r0=17(x1), r1=103(y1), r2=11(x2), r3=252(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 103
LDI r2, 11
LDI r3, 252
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
