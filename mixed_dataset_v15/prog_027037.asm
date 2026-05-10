; DESCRIPTION: Composite: Creates a magenta circular shape at (427, 157) with radius 76 then Renders a orange box of size 64x47 starting at (238, 96).
; PLAN: r0=427(x), r1=157(y), r2=76(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=238(x), r6=96(y), r7=64(width), r8=47(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 427
LDI r1, 157
LDI r2, 76
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 238
LDI r6, 96
LDI r7, 64
LDI r8, 47
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
