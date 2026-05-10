; DESCRIPTION: Draws a black rectangle at (338, 76) with width 47 and height 108.
; PLAN: r0=338(x), r1=76(y), r2=47(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 76
LDI r2, 47
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
