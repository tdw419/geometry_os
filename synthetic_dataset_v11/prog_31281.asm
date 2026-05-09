; DESCRIPTION: Places a green line segment connecting (135, 91) to (64, 90).
; PLAN: r0=135(x1), r1=91(y1), r2=64(x2), r3=90(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 91
LDI r2, 64
LDI r3, 90
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
