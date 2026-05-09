; DESCRIPTION: Renders a yellow line between points (67, 224) and (222, 132).
; PLAN: r0=67(x1), r1=224(y1), r2=222(x2), r3=132(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 224
LDI r2, 222
LDI r3, 132
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
