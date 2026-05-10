; DESCRIPTION: Places a green line segment connecting (473, 224) to (162, 240).
; PLAN: r0=473(x1), r1=224(y1), r2=162(x2), r3=240(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 224
LDI r2, 162
LDI r3, 240
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
