; DESCRIPTION: Draws a blue rectangle at (107, 18) with width 102 and height 83.
; PLAN: r0=107(x), r1=18(y), r2=102(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 18
LDI r2, 102
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
