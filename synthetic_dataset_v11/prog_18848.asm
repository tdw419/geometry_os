; DESCRIPTION: Places a green line segment connecting (224, 192) to (246, 104).
; PLAN: r0=224(x1), r1=192(y1), r2=246(x2), r3=104(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 192
LDI r2, 246
LDI r3, 104
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
