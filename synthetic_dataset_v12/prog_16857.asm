; DESCRIPTION: Places a green line segment connecting (87, 162) to (304, 130).
; PLAN: r0=87(x1), r1=162(y1), r2=304(x2), r3=130(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 162
LDI r2, 304
LDI r3, 130
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
