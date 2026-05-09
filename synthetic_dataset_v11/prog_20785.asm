; DESCRIPTION: Draws a blue line from (19, 112) to (220, 203).
; PLAN: r0=19(x1), r1=112(y1), r2=220(x2), r3=203(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 112
LDI r2, 220
LDI r3, 203
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
