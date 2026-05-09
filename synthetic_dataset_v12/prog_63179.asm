; DESCRIPTION: Composite: Renders a yellow box of size 117x51 starting at (163, 39) then Creates a purple circular shape at (388, 147) with radius 54.
; PLAN: r0=163(x), r1=39(y), r2=117(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=388(x), r6=147(y), r7=54(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 163
LDI r1, 39
LDI r2, 117
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 388
LDI r6, 147
LDI r7, 54
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
