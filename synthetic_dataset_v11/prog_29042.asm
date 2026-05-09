; DESCRIPTION: Draws a purple rectangle at (25, 224) with width 85 and height 21.
; PLAN: r0=25(x), r1=224(y), r2=85(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 224
LDI r2, 85
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
