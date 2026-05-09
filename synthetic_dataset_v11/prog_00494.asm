; DESCRIPTION: Composite: . Then Creates a green circular shape at (100, 121) with radius 43. Then Draws a black rectangle at (66, 11) with width 82 and height 113.
; PLAN: r0=100(x), r1=121(y), r2=43(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=66(x), r1=11(y), r2=82(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a green circular shape at (100, 121) with radius 43.
; PLAN: r0=100(x), r1=121(y), r2=43(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 121
LDI r2, 43
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a black rectangle at (66, 11) with width 82 and height 113.
; PLAN: r0=66(x), r1=11(y), r2=82(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 11
LDI r2, 82
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
