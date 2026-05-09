; DESCRIPTION: Draws a purple rectangle at (102, 130) with width 95 and height 103.
; PLAN: r0=102(x), r1=130(y), r2=95(width), r3=103(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 130
LDI r2, 95
LDI r3, 103
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
