; DESCRIPTION: Places a green line segment connecting (189, 66) to (62, 186).
; PLAN: r0=189(x1), r1=66(y1), r2=62(x2), r3=186(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 66
LDI r2, 62
LDI r3, 186
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
