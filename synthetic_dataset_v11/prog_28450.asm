; DESCRIPTION: Draws a black rectangle at (134, 235) with width 113 and height 15.
; PLAN: r0=134(x), r1=235(y), r2=113(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 235
LDI r2, 113
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
