; DESCRIPTION: Composite: Draws a blue circle centered at (129, 193) with radius 25 then Places a magenta 77x60 rectangle at position (172, 17).
; PLAN: r0=129(x), r1=193(y), r2=25(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=172(x), r6=17(y), r7=77(width), r8=60(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 129
LDI r1, 193
LDI r2, 25
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 172
LDI r6, 17
LDI r7, 77
LDI r8, 60
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
