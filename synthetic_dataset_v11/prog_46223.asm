; DESCRIPTION: Draws a blue rectangle at (105, 103) with width 50 and height 114.
; PLAN: r0=105(x), r1=103(y), r2=50(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 103
LDI r2, 50
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
