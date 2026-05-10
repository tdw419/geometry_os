; DESCRIPTION: Places a yellow line segment connecting (274, 206) to (4, 129).
; PLAN: r0=274(x1), r1=206(y1), r2=4(x2), r3=129(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 206
LDI r2, 4
LDI r3, 129
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
