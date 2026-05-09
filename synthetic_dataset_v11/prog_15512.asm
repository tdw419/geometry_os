; DESCRIPTION: Composite: . Then Renders a red disk with center (49, 138) and radius 41. Then Draws a black rectangle at (231, 131) with width 11 and height 18.
; PLAN: r0=49(x), r1=138(y), r2=41(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=231(x), r1=131(y), r2=11(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a red disk with center (49, 138) and radius 41.
; PLAN: r0=49(x), r1=138(y), r2=41(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 49
LDI r1, 138
LDI r2, 41
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a black rectangle at (231, 131) with width 11 and height 18.
; PLAN: r0=231(x), r1=131(y), r2=11(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 131
LDI r2, 11
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
