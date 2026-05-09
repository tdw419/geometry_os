; DESCRIPTION: Draws a blue rectangle at (105, 102) with width 14 and height 82.
; PLAN: r0=105(x), r1=102(y), r2=14(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 102
LDI r2, 14
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
