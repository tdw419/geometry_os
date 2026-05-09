; DESCRIPTION: Places a green line segment connecting (8, 142) to (319, 0).
; PLAN: r0=8(x1), r1=142(y1), r2=319(x2), r3=0(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 142
LDI r2, 319
LDI r3, 0
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
