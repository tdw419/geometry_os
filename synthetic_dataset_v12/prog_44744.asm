; DESCRIPTION: Draws a blue rectangle at (276, 36) with width 46 and height 15.
; PLAN: r0=276(x), r1=36(y), r2=46(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 36
LDI r2, 46
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
