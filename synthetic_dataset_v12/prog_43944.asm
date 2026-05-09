; DESCRIPTION: Draws a blue rectangle at (51, 39) with width 96 and height 102.
; PLAN: r0=51(x), r1=39(y), r2=96(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 39
LDI r2, 96
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
