; DESCRIPTION: Composite: . Then Creates a black circular shape at (125, 101) with radius 45. Then Creates a magenta rectangular region at (90, 75) spanning 47 by 94 pixels.
; PLAN: r0=125(x), r1=101(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=90(x), r1=75(y), r2=47(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a black circular shape at (125, 101) with radius 45.
; PLAN: r0=125(x), r1=101(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 101
LDI r2, 45
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a magenta rectangular region at (90, 75) spanning 47 by 94 pixels.
; PLAN: r0=90(x), r1=75(y), r2=47(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 75
LDI r2, 47
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
