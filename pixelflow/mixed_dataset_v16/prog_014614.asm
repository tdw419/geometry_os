; DESCRIPTION: Renders a green line between points (191, 15) and (366, 39).
; PLAN: r0=191(x1), r1=15(y1), r2=366(x2), r3=39(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 15
LDI r2, 366
LDI r3, 39
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
