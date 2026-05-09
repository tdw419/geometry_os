; DESCRIPTION: Places a green line segment connecting (442, 71) to (246, 188).
; PLAN: r0=442(x1), r1=71(y1), r2=246(x2), r3=188(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 71
LDI r2, 246
LDI r3, 188
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
