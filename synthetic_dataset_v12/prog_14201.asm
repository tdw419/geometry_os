; DESCRIPTION: Places a green line segment connecting (57, 176) to (241, 130).
; PLAN: r0=57(x1), r1=176(y1), r2=241(x2), r3=130(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 176
LDI r2, 241
LDI r3, 130
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
