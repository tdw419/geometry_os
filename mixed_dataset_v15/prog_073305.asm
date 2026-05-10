; DESCRIPTION: Composite: Draws a black circle centered at (252, 123) with radius 65 then Creates a magenta rectangular region at (206, 38) spanning 100 by 112 pixels.
; PLAN: r0=252(x), r1=123(y), r2=65(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=206(x), r6=38(y), r7=100(width), r8=112(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 252
LDI r1, 123
LDI r2, 65
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 206
LDI r6, 38
LDI r7, 100
LDI r8, 112
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
