; DESCRIPTION: Composite: Renders a magenta box of size 94x66 starting at (34, 88) then Creates a blue circular shape at (70, 147) with radius 50.
; PLAN: r0=34(x), r1=88(y), r2=94(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=70(x), r6=147(y), r7=50(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 34
LDI r1, 88
LDI r2, 94
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 70
LDI r6, 147
LDI r7, 50
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
