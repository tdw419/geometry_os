; DESCRIPTION: Composite: Draws a white circle centered at (397, 86) with radius 74 then Places a magenta 52x110 rectangle at position (403, 106).
; PLAN: r0=397(x), r1=86(y), r2=74(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=403(x), r6=106(y), r7=52(width), r8=110(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 397
LDI r1, 86
LDI r2, 74
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 403
LDI r6, 106
LDI r7, 52
LDI r8, 110
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
