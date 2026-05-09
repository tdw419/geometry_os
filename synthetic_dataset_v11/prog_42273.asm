; DESCRIPTION: Renders a blue line between points (118, 203) and (229, 134).
; PLAN: r0=118(x1), r1=203(y1), r2=229(x2), r3=134(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 203
LDI r2, 229
LDI r3, 134
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
