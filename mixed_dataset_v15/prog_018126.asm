; DESCRIPTION: Composite: Creates a magenta circular shape at (212, 142) with radius 70 then Creates a green rectangular region at (326, 13) spanning 100 by 76 pixels.
; PLAN: r0=212(x), r1=142(y), r2=70(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=326(x), r6=13(y), r7=100(width), r8=76(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 212
LDI r1, 142
LDI r2, 70
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 326
LDI r6, 13
LDI r7, 100
LDI r8, 76
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
