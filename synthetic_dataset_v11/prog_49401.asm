; DESCRIPTION: Draws a red rectangle at (157, 224) with width 17 and height 15.
; PLAN: r0=157(x), r1=224(y), r2=17(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 224
LDI r2, 17
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
