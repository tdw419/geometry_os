; DESCRIPTION: Composite: Renders a blue box of size 103x96 starting at (309, 116) then Creates a yellow circular shape at (50, 190) with radius 29.
; PLAN: r0=309(x), r1=116(y), r2=103(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=50(x), r6=190(y), r7=29(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 309
LDI r1, 116
LDI r2, 103
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 50
LDI r6, 190
LDI r7, 29
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
