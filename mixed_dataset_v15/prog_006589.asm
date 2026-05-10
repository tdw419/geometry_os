; DESCRIPTION: Composite: Renders a magenta box of size 28x101 starting at (3, 99) then Creates a purple circular shape at (154, 78) with radius 18.
; PLAN: r0=3(x), r1=99(y), r2=28(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=154(x), r6=78(y), r7=18(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 3
LDI r1, 99
LDI r2, 28
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 154
LDI r6, 78
LDI r7, 18
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
