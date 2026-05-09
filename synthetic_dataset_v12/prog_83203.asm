; DESCRIPTION: Composite: Creates a orange circular shape at (358, 64) with radius 53 then Creates a magenta rectangular region at (176, 166) spanning 72 by 87 pixels.
; PLAN: r0=358(x), r1=64(y), r2=53(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=176(x), r6=166(y), r7=72(width), r8=87(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 358
LDI r1, 64
LDI r2, 53
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 176
LDI r6, 166
LDI r7, 72
LDI r8, 87
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
