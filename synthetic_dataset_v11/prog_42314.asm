; DESCRIPTION: Places a green line segment connecting (142, 111) to (192, 189).
; PLAN: r0=142(x1), r1=111(y1), r2=192(x2), r3=189(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 111
LDI r2, 192
LDI r3, 189
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
