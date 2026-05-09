; DESCRIPTION: Composite: . Then Draws a black circle centered at (187, 121) with radius 37. Then Draws a black rectangle at (12, 153) with width 60 and height 89.
; PLAN: r0=187(x), r1=121(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=12(x), r1=153(y), r2=60(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a black circle centered at (187, 121) with radius 37.
; PLAN: r0=187(x), r1=121(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 121
LDI r2, 37
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a black rectangle at (12, 153) with width 60 and height 89.
; PLAN: r0=12(x), r1=153(y), r2=60(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 153
LDI r2, 60
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
