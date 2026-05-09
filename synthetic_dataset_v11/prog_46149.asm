; DESCRIPTION: Places a green line segment connecting (184, 241) to (225, 75).
; PLAN: r0=184(x1), r1=241(y1), r2=225(x2), r3=75(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 241
LDI r2, 225
LDI r3, 75
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
