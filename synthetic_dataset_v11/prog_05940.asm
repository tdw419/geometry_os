; DESCRIPTION: Draws a white rectangle at (79, 210) with width 88 and height 15.
; PLAN: r0=79(x), r1=210(y), r2=88(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 210
LDI r2, 88
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
