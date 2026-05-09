; DESCRIPTION: Composite: . Then Creates a magenta circular shape at (61, 114) with radius 53. Then Draws a orange rectangle at (5, 38) with width 47 and height 90.
; PLAN: r0=61(x), r1=114(y), r2=53(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=5(x), r1=38(y), r2=47(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a magenta circular shape at (61, 114) with radius 53.
; PLAN: r0=61(x), r1=114(y), r2=53(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 114
LDI r2, 53
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a orange rectangle at (5, 38) with width 47 and height 90.
; PLAN: r0=5(x), r1=38(y), r2=47(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 38
LDI r2, 47
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
