; DESCRIPTION: Draws a blue rectangle at (498, 114) with width 14 and height 74.
; PLAN: r0=498(x), r1=114(y), r2=14(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 114
LDI r2, 14
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
