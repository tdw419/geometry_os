; DESCRIPTION: Draws a black rectangle at (30, 43) with width 57 and height 70.
; PLAN: r0=30(x), r1=43(y), r2=57(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 43
LDI r2, 57
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
