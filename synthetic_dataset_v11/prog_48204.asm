; DESCRIPTION: Renders a yellow line between points (102, 224) and (232, 68).
; PLAN: r0=102(x1), r1=224(y1), r2=232(x2), r3=68(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 224
LDI r2, 232
LDI r3, 68
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
