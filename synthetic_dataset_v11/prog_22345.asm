; DESCRIPTION: Composite: . Then Draws a green rectangle at (17, 114) with width 71 and height 118. Then Places a red dot at position (198, 88).
; PLAN: r0=17(x), r1=114(y), r2=71(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=198(x), r1=88(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a green rectangle at (17, 114) with width 71 and height 118.
; PLAN: r0=17(x), r1=114(y), r2=71(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 114
LDI r2, 71
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a red dot at position (198, 88).
; PLAN: r0=198(x), r1=88(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 198
LDI r1, 88
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
