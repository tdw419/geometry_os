; DESCRIPTION: Places a green line segment connecting (253, 240) to (159, 189).
; PLAN: r0=253(x1), r1=240(y1), r2=159(x2), r3=189(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 240
LDI r2, 159
LDI r3, 189
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
