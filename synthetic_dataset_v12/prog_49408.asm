; DESCRIPTION: Composite: Creates a magenta rectangular region at (441, 167) spanning 69 by 25 pixels then Creates a cyan circular shape at (435, 117) with radius 60.
; PLAN: r0=441(x), r1=167(y), r2=69(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=435(x), r6=117(y), r7=60(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 441
LDI r1, 167
LDI r2, 69
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 435
LDI r6, 117
LDI r7, 60
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
