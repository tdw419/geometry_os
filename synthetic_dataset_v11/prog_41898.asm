; DESCRIPTION: Renders a blue line between points (52, 95) and (239, 201).
; PLAN: r0=52(x1), r1=95(y1), r2=239(x2), r3=201(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 95
LDI r2, 239
LDI r3, 201
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
