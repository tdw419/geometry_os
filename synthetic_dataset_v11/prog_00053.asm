; DESCRIPTION: Composite: . Then Places a white dot at position (209, 41). Then Draws a black rectangle at (81, 39) with width 114 and height 66.
; PLAN: r0=209(x), r1=41(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=81(x), r1=39(y), r2=114(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white dot at position (209, 41).
; PLAN: r0=209(x), r1=41(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 209
LDI r1, 41
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a black rectangle at (81, 39) with width 114 and height 66.
; PLAN: r0=81(x), r1=39(y), r2=114(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 39
LDI r2, 114
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
