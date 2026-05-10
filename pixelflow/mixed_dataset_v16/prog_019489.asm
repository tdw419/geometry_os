; DESCRIPTION: Composite: Places a purple line segment connecting (59, 5) to (175, 64) then Creates a yellow circular shape at (450, 100) with radius 14.
; PLAN: r0=59(x1), r1=5(y1), r2=175(x2), r3=64(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=450(x), r6=100(y), r7=14(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 59
LDI r1, 5
LDI r2, 175
LDI r3, 64
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 450
LDI r6, 100
LDI r7, 14
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
