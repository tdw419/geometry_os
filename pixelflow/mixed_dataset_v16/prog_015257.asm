; DESCRIPTION: Composite: Renders a yellow box of size 12x75 starting at (127, 97) then Creates a purple circular shape at (87, 99) with radius 11.
; PLAN: r0=127(x), r1=97(y), r2=12(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=87(x), r6=99(y), r7=11(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 127
LDI r1, 97
LDI r2, 12
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 87
LDI r6, 99
LDI r7, 11
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
