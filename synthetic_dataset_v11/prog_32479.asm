; DESCRIPTION: Renders a blue line between points (239, 49) and (84, 74).
; PLAN: r0=239(x1), r1=49(y1), r2=84(x2), r3=74(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 49
LDI r2, 84
LDI r3, 74
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
