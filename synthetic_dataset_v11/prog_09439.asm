; DESCRIPTION: Composite: . Then Creates a magenta rectangular region at (83, 163) spanning 96 by 26 pixels. Then Creates a orange circular shape at (191, 199) with radius 29.
; PLAN: r0=83(x), r1=163(y), r2=96(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=191(x), r1=199(y), r2=29(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a magenta rectangular region at (83, 163) spanning 96 by 26 pixels.
; PLAN: r0=83(x), r1=163(y), r2=96(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 163
LDI r2, 96
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a orange circular shape at (191, 199) with radius 29.
; PLAN: r0=191(x), r1=199(y), r2=29(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 199
LDI r2, 29
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
