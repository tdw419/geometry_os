; DESCRIPTION: Renders a blue line between points (420, 198) and (90, 203).
; PLAN: r0=420(x1), r1=198(y1), r2=90(x2), r3=203(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 198
LDI r2, 90
LDI r3, 203
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
