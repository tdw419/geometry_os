; DESCRIPTION: Places a yellow line segment connecting (188, 2) to (228, 211).
; PLAN: r0=188(x1), r1=2(y1), r2=228(x2), r3=211(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 2
LDI r2, 228
LDI r3, 211
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
