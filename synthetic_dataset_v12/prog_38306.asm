; DESCRIPTION: Draws a white rectangle at (303, 238) with width 101 and height 15.
; PLAN: r0=303(x), r1=238(y), r2=101(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 238
LDI r2, 101
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
