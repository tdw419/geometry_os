; DESCRIPTION: Renders a blue line between points (105, 213) and (452, 84).
; PLAN: r0=105(x1), r1=213(y1), r2=452(x2), r3=84(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 213
LDI r2, 452
LDI r3, 84
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
