; DESCRIPTION: Composite: . Then Creates a black circular shape at (170, 128) with radius 40. Then Creates a orange rectangular region at (185, 167) spanning 49 by 52 pixels.
; PLAN: r0=170(x), r1=128(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=185(x), r1=167(y), r2=49(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a black circular shape at (170, 128) with radius 40.
; PLAN: r0=170(x), r1=128(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 128
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a orange rectangular region at (185, 167) spanning 49 by 52 pixels.
; PLAN: r0=185(x), r1=167(y), r2=49(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 167
LDI r2, 49
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
