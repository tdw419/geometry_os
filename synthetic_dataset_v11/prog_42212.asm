; DESCRIPTION: Composite: . Then Renders a black box of size 81x91 starting at (91, 62). Then Draws a black circle centered at (155, 164) with radius 57.
; PLAN: r0=91(x), r1=62(y), r2=81(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=155(x), r1=164(y), r2=57(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a black box of size 81x91 starting at (91, 62).
; PLAN: r0=91(x), r1=62(y), r2=81(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 62
LDI r2, 81
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a black circle centered at (155, 164) with radius 57.
; PLAN: r0=155(x), r1=164(y), r2=57(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 164
LDI r2, 57
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
