; DESCRIPTION: Composite: . Then Creates a black circular shape at (96, 57) with radius 27. Then Creates a purple rectangular region at (183, 72) spanning 58 by 13 pixels.
; PLAN: r0=96(x), r1=57(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=183(x), r1=72(y), r2=58(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a black circular shape at (96, 57) with radius 27.
; PLAN: r0=96(x), r1=57(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 57
LDI r2, 27
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a purple rectangular region at (183, 72) spanning 58 by 13 pixels.
; PLAN: r0=183(x), r1=72(y), r2=58(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 72
LDI r2, 58
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
