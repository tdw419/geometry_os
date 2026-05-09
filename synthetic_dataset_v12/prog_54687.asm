; DESCRIPTION: Renders a blue line between points (52, 239) and (22, 96).
; PLAN: r0=52(x1), r1=239(y1), r2=22(x2), r3=96(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 239
LDI r2, 22
LDI r3, 96
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
