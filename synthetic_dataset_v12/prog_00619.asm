; DESCRIPTION: Renders a yellow line between points (63, 49) and (474, 224).
; PLAN: r0=63(x1), r1=49(y1), r2=474(x2), r3=224(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 49
LDI r2, 474
LDI r3, 224
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
