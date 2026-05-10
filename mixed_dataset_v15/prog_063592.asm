; DESCRIPTION: Renders a blue line between points (449, 203) and (503, 158).
; PLAN: r0=449(x1), r1=203(y1), r2=503(x2), r3=158(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 203
LDI r2, 503
LDI r3, 158
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
