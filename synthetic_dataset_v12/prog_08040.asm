; DESCRIPTION: Places a green line segment connecting (48, 156) to (50, 245).
; PLAN: r0=48(x1), r1=156(y1), r2=50(x2), r3=245(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 156
LDI r2, 50
LDI r3, 245
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
