; DESCRIPTION: Places a yellow line segment connecting (186, 39) to (136, 212).
; PLAN: r0=186(x1), r1=39(y1), r2=136(x2), r3=212(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 39
LDI r2, 136
LDI r3, 212
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
