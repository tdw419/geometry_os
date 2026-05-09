; DESCRIPTION: Renders a yellow line between points (222, 248) and (25, 224).
; PLAN: r0=222(x1), r1=248(y1), r2=25(x2), r3=224(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 248
LDI r2, 25
LDI r3, 224
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
