; DESCRIPTION: Composite: Draws a green circle centered at (148, 73) with radius 65 then Creates a magenta rectangular region at (283, 48) spanning 45 by 30 pixels.
; PLAN: r0=148(x), r1=73(y), r2=65(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=283(x), r6=48(y), r7=45(width), r8=30(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 148
LDI r1, 73
LDI r2, 65
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 283
LDI r6, 48
LDI r7, 45
LDI r8, 30
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
