; DESCRIPTION: Composite: . Then Draws a orange circle centered at (130, 134) with radius 76. Then Creates a white rectangular region at (146, 57) spanning 97 by 101 pixels.
; PLAN: r0=130(x), r1=134(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=146(x), r1=57(y), r2=97(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a orange circle centered at (130, 134) with radius 76.
; PLAN: r0=130(x), r1=134(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 134
LDI r2, 76
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a white rectangular region at (146, 57) spanning 97 by 101 pixels.
; PLAN: r0=146(x), r1=57(y), r2=97(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 57
LDI r2, 97
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
