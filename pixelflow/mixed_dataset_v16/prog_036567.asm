; DESCRIPTION: Renders a yellow line between points (84, 242) and (163, 75).
; PLAN: r0=84(x1), r1=242(y1), r2=163(x2), r3=75(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 242
LDI r2, 163
LDI r3, 75
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
