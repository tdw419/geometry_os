; DESCRIPTION: Composite: . Then Creates a yellow circular shape at (63, 119) with radius 40. Then Creates a white rectangular region at (132, 167) spanning 28 by 63 pixels.
; PLAN: r0=63(x), r1=119(y), r2=40(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=132(x), r1=167(y), r2=28(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a yellow circular shape at (63, 119) with radius 40.
; PLAN: r0=63(x), r1=119(y), r2=40(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 63
LDI r1, 119
LDI r2, 40
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a white rectangular region at (132, 167) spanning 28 by 63 pixels.
; PLAN: r0=132(x), r1=167(y), r2=28(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 167
LDI r2, 28
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
