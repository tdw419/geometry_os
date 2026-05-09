; DESCRIPTION: Composite: . Then Draws a magenta rectangle at (58, 117) with width 22 and height 83. Then Places a yellow circle of radius 41 at center (167, 199).
; PLAN: r0=58(x), r1=117(y), r2=22(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=167(x), r1=199(y), r2=41(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a magenta rectangle at (58, 117) with width 22 and height 83.
; PLAN: r0=58(x), r1=117(y), r2=22(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 117
LDI r2, 22
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow circle of radius 41 at center (167, 199).
; PLAN: r0=167(x), r1=199(y), r2=41(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 199
LDI r2, 41
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
