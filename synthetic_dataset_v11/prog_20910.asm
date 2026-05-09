; DESCRIPTION: Places a green line segment connecting (119, 206) to (204, 224).
; PLAN: r0=119(x1), r1=206(y1), r2=204(x2), r3=224(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 206
LDI r2, 204
LDI r3, 224
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
