; DESCRIPTION: Places a green line segment connecting (29, 28) to (359, 45).
; PLAN: r0=29(x1), r1=28(y1), r2=359(x2), r3=45(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 28
LDI r2, 359
LDI r3, 45
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
