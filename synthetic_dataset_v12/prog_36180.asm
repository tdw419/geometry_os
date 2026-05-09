; DESCRIPTION: Draws a purple rectangle at (187, 224) with width 71 and height 30.
; PLAN: r0=187(x), r1=224(y), r2=71(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 224
LDI r2, 71
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
