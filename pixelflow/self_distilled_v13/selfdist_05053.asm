; DESCRIPTION: Renders a yellow line segment connecting (28, 53) to (60, 54).
; PLAN: r0=28(x1), r1=53(y1), r2=60(x2), r3=54(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 53
LDI r2, 60
LDI r3, 54
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
