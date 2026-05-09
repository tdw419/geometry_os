; DESCRIPTION: Composite: Places a yellow line segment connecting (454, 204) to (501, 186) then Creates a purple circular shape at (420, 151) with radius 19.
; PLAN: r0=454(x1), r1=204(y1), r2=501(x2), r3=186(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=420(x), r6=151(y), r7=19(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 454
LDI r1, 204
LDI r2, 501
LDI r3, 186
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 420
LDI r6, 151
LDI r7, 19
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
