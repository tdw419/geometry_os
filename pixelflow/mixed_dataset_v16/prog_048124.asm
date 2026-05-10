; DESCRIPTION: Composite: Renders a magenta disk with center (397, 78) and radius 31 then Renders a magenta box of size 53x45 starting at (371, 35).
; PLAN: r0=397(x), r1=78(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=371(x), r6=35(y), r7=53(width), r8=45(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 397
LDI r1, 78
LDI r2, 31
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 371
LDI r6, 35
LDI r7, 53
LDI r8, 45
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
