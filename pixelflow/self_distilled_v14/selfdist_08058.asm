; DESCRIPTION: Renders a yellow line segment connecting (128, 69) to (156, 83).
; PLAN: r0=128(x1), r1=69(y1), r2=156(x2), r3=83(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 69
LDI r2, 156
LDI r3, 83
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
