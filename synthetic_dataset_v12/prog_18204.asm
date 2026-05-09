; DESCRIPTION: Draws a red rectangle at (238, 130) with width 62 and height 72.
; PLAN: r0=238(x), r1=130(y), r2=62(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 130
LDI r2, 62
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
