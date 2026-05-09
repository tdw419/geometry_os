; DESCRIPTION: Places a yellow line segment connecting (136, 125) to (144, 122).
; PLAN: r0=136(x1), r1=125(y1), r2=144(x2), r3=122(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 125
LDI r2, 144
LDI r3, 122
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
