; DESCRIPTION: Composite: . Then Creates a green rectangular region at (110, 106) spanning 10 by 114 pixels. Then Creates a white circular shape at (181, 226) with radius 14.
; PLAN: r0=110(x), r1=106(y), r2=10(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=181(x), r1=226(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a green rectangular region at (110, 106) spanning 10 by 114 pixels.
; PLAN: r0=110(x), r1=106(y), r2=10(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 106
LDI r2, 10
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a white circular shape at (181, 226) with radius 14.
; PLAN: r0=181(x), r1=226(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 226
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
