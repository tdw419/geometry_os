; DESCRIPTION: Composite: . Then Creates a orange circular shape at (140, 76) with radius 62. Then Renders a orange box of size 71x62 starting at (166, 124).
; PLAN: r0=140(x), r1=76(y), r2=62(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=166(x), r1=124(y), r2=71(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a orange circular shape at (140, 76) with radius 62.
; PLAN: r0=140(x), r1=76(y), r2=62(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 76
LDI r2, 62
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a orange box of size 71x62 starting at (166, 124).
; PLAN: r0=166(x), r1=124(y), r2=71(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 124
LDI r2, 71
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
