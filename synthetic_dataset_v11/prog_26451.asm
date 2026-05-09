; DESCRIPTION: Composite: . Then Creates a orange circular shape at (202, 99) with radius 40. Then Creates a blue rectangular region at (30, 79) spanning 26 by 114 pixels.
; PLAN: r0=202(x), r1=99(y), r2=40(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=30(x), r1=79(y), r2=26(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a orange circular shape at (202, 99) with radius 40.
; PLAN: r0=202(x), r1=99(y), r2=40(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 99
LDI r2, 40
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a blue rectangular region at (30, 79) spanning 26 by 114 pixels.
; PLAN: r0=30(x), r1=79(y), r2=26(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 79
LDI r2, 26
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
