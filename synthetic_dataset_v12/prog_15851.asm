; DESCRIPTION: Renders a green line between points (84, 56) and (366, 98).
; PLAN: r0=84(x1), r1=56(y1), r2=366(x2), r3=98(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 56
LDI r2, 366
LDI r3, 98
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
