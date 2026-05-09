; DESCRIPTION: Composite: . Then Places a white dot at position (114, 155). Then Renders a black box of size 84x15 starting at (59, 151).
; PLAN: r0=114(x), r1=155(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=59(x), r1=151(y), r2=84(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white dot at position (114, 155).
; PLAN: r0=114(x), r1=155(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 114
LDI r1, 155
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a black box of size 84x15 starting at (59, 151).
; PLAN: r0=59(x), r1=151(y), r2=84(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 151
LDI r2, 84
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
