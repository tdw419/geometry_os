; DESCRIPTION: Renders a yellow line segment connecting (252, 32) to (10, 132).
; PLAN: r0=252(x1), r1=32(y1), r2=10(x2), r3=132(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 32
LDI r2, 10
LDI r3, 132
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
