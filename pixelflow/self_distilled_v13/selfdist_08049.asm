; DESCRIPTION: Renders a yellow line segment connecting (253, 20) to (307, 28).
; PLAN: r0=253(x1), r1=20(y1), r2=307(x2), r3=28(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 20
LDI r2, 307
LDI r3, 28
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
