; DESCRIPTION: Composite: Creates a white circular shape at (154, 97) with radius 10 then Sets a single yellow pixel at (172, 0) then Creates a magenta rectangular region at (403, 199) spanning 31 by 13 pixels.
; PLAN: r0=154(x), r1=97(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=172(x), r6=0(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=403(x), r11=199(y), r12=31(width), r13=13(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 154
LDI r1, 97
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 172
LDI r6, 0
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 403
LDI r11, 199
LDI r12, 31
LDI r13, 13
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
