; DESCRIPTION: Renders a blue line between points (420, 107) and (84, 4).
; PLAN: r0=420(x1), r1=107(y1), r2=84(x2), r3=4(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 107
LDI r2, 84
LDI r3, 4
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
