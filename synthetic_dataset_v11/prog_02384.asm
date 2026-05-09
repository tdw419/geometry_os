; DESCRIPTION: Renders a green line between points (84, 132) and (6, 101).
; PLAN: r0=84(x1), r1=132(y1), r2=6(x2), r3=101(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 132
LDI r2, 6
LDI r3, 101
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
