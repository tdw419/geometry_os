; DESCRIPTION: Composite: Draws a orange circle centered at (423, 183) with radius 42 then Creates a green rectangular region at (404, 105) spanning 42 by 102 pixels.
; PLAN: r0=423(x), r1=183(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=404(x), r6=105(y), r7=42(width), r8=102(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 423
LDI r1, 183
LDI r2, 42
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 404
LDI r6, 105
LDI r7, 42
LDI r8, 102
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
