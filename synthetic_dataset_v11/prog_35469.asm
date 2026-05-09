; DESCRIPTION: Draws a blue rectangle at (166, 172) with width 66 and height 19.
; PLAN: r0=166(x), r1=172(y), r2=66(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 172
LDI r2, 66
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
