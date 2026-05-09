; DESCRIPTION: Draws a black rectangle at (167, 108) with width 89 and height 65.
; PLAN: r0=167(x), r1=108(y), r2=89(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 108
LDI r2, 89
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
