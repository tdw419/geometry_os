; DESCRIPTION: Places a yellow line segment connecting (111, 12) to (8, 24).
; PLAN: r0=111(x1), r1=12(y1), r2=8(x2), r3=24(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 12
LDI r2, 8
LDI r3, 24
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
