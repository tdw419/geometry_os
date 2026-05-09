; DESCRIPTION: Composite: Places a purple line segment connecting (262, 239) to (166, 4) then Creates a yellow circular shape at (300, 204) with radius 26.
; PLAN: r0=262(x1), r1=239(y1), r2=166(x2), r3=4(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=300(x), r6=204(y), r7=26(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 262
LDI r1, 239
LDI r2, 166
LDI r3, 4
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 300
LDI r6, 204
LDI r7, 26
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
