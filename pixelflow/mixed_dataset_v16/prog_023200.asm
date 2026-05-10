; DESCRIPTION: Renders a purple line segment connecting (196, 114) to (84, 108).
; PLAN: r0=196(x1), r1=114(y1), r2=84(x2), r3=108(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 114
LDI r2, 84
LDI r3, 108
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
