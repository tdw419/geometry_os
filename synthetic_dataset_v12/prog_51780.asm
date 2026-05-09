; DESCRIPTION: Composite: Creates a magenta rectangular region at (194, 50) spanning 84 by 103 pixels then Places a white circle of radius 13 at center (421, 100).
; PLAN: r0=194(x), r1=50(y), r2=84(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=421(x), r6=100(y), r7=13(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 194
LDI r1, 50
LDI r2, 84
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 421
LDI r6, 100
LDI r7, 13
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
