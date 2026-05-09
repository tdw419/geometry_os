; DESCRIPTION: Renders a green line between points (84, 170) and (100, 115).
; PLAN: r0=84(x1), r1=170(y1), r2=100(x2), r3=115(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 170
LDI r2, 100
LDI r3, 115
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
