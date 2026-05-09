; DESCRIPTION: Composite: . Then Draws a orange rectangle at (158, 55) with width 88 and height 71. Then Creates a orange circular shape at (98, 121) with radius 43.
; PLAN: r0=158(x), r1=55(y), r2=88(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=98(x), r1=121(y), r2=43(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a orange rectangle at (158, 55) with width 88 and height 71.
; PLAN: r0=158(x), r1=55(y), r2=88(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 55
LDI r2, 88
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a orange circular shape at (98, 121) with radius 43.
; PLAN: r0=98(x), r1=121(y), r2=43(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 121
LDI r2, 43
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
