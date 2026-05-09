; DESCRIPTION: Composite: . Then Creates a cyan circular shape at (160, 114) with radius 75. Then Creates a black rectangular region at (99, 89) spanning 40 by 20 pixels.
; PLAN: r0=160(x), r1=114(y), r2=75(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=99(x), r1=89(y), r2=40(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a cyan circular shape at (160, 114) with radius 75.
; PLAN: r0=160(x), r1=114(y), r2=75(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 114
LDI r2, 75
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a black rectangular region at (99, 89) spanning 40 by 20 pixels.
; PLAN: r0=99(x), r1=89(y), r2=40(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 89
LDI r2, 40
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
