; DESCRIPTION: Places a green line segment connecting (130, 48) to (324, 12).
; PLAN: r0=130(x1), r1=48(y1), r2=324(x2), r3=12(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 48
LDI r2, 324
LDI r3, 12
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
