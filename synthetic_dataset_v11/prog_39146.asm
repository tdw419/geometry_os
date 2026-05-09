; DESCRIPTION: Renders a yellow line between points (28, 123) and (144, 246).
; PLAN: r0=28(x1), r1=123(y1), r2=144(x2), r3=246(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 123
LDI r2, 144
LDI r3, 246
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
