; DESCRIPTION: Draws a black rectangle at (151, 111) with width 30 and height 107.
; PLAN: r0=151(x), r1=111(y), r2=30(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 111
LDI r2, 30
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
