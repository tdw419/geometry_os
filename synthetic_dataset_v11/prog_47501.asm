; DESCRIPTION: Draws a blue rectangle at (126, 39) with width 114 and height 33.
; PLAN: r0=126(x), r1=39(y), r2=114(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 39
LDI r2, 114
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
