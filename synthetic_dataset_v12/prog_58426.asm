; DESCRIPTION: Renders a green line between points (189, 224) and (490, 84).
; PLAN: r0=189(x1), r1=224(y1), r2=490(x2), r3=84(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 224
LDI r2, 490
LDI r3, 84
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
