; DESCRIPTION: Places a green line segment connecting (442, 57) to (222, 64).
; PLAN: r0=442(x1), r1=57(y1), r2=222(x2), r3=64(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 57
LDI r2, 222
LDI r3, 64
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
