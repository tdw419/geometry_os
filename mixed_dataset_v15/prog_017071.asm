; DESCRIPTION: Composite: Draws a purple circle centered at (209, 148) with radius 64 then Creates a cyan rectangular region at (164, 78) spanning 66 by 20 pixels.
; PLAN: r0=209(x), r1=148(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=164(x), r6=78(y), r7=66(width), r8=20(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 209
LDI r1, 148
LDI r2, 64
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 164
LDI r6, 78
LDI r7, 66
LDI r8, 20
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
