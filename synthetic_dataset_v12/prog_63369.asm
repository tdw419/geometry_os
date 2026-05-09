; DESCRIPTION: Renders a blue line between points (118, 84) and (362, 28).
; PLAN: r0=118(x1), r1=84(y1), r2=362(x2), r3=28(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 84
LDI r2, 362
LDI r3, 28
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
