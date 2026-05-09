; DESCRIPTION: Renders a purple line between points (236, 239) and (377, 89).
; PLAN: r0=236(x1), r1=239(y1), r2=377(x2), r3=89(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 239
LDI r2, 377
LDI r3, 89
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
