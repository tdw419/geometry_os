; DESCRIPTION: Renders a yellow line between points (136, 222) and (207, 3).
; PLAN: r0=136(x1), r1=222(y1), r2=207(x2), r3=3(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 222
LDI r2, 207
LDI r3, 3
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
