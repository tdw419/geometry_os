; DESCRIPTION: Places a green line segment connecting (273, 159) to (232, 12).
; PLAN: r0=273(x1), r1=159(y1), r2=232(x2), r3=12(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 159
LDI r2, 232
LDI r3, 12
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
