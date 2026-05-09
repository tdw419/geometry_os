; DESCRIPTION: Composite: . Then Creates a black rectangular region at (99, 100) spanning 118 by 42 pixels. Then Draws a white circle centered at (203, 173) with radius 31.
; PLAN: r0=99(x), r1=100(y), r2=118(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=203(x), r1=173(y), r2=31(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a black rectangular region at (99, 100) spanning 118 by 42 pixels.
; PLAN: r0=99(x), r1=100(y), r2=118(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 100
LDI r2, 118
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a white circle centered at (203, 173) with radius 31.
; PLAN: r0=203(x), r1=173(y), r2=31(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 173
LDI r2, 31
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
