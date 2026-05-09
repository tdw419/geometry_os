; DESCRIPTION: Places a green line segment connecting (75, 176) to (88, 37).
; PLAN: r0=75(x1), r1=176(y1), r2=88(x2), r3=37(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 176
LDI r2, 88
LDI r3, 37
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
