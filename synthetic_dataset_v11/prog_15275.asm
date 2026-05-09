; DESCRIPTION: Renders a yellow line between points (28, 82) and (9, 224).
; PLAN: r0=28(x1), r1=82(y1), r2=9(x2), r3=224(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 82
LDI r2, 9
LDI r3, 224
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
