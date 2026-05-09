; DESCRIPTION: Renders a yellow line between points (511, 65) and (30, 224).
; PLAN: r0=511(x1), r1=65(y1), r2=30(x2), r3=224(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 65
LDI r2, 30
LDI r3, 224
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
