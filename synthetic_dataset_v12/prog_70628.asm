; DESCRIPTION: Draws a purple rectangle at (228, 130) with width 108 and height 79.
; PLAN: r0=228(x), r1=130(y), r2=108(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 130
LDI r2, 108
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
