; DESCRIPTION: Places a green line segment connecting (141, 28) to (240, 176).
; PLAN: r0=141(x1), r1=28(y1), r2=240(x2), r3=176(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 28
LDI r2, 240
LDI r3, 176
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
