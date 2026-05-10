; DESCRIPTION: Draws a purple rectangle at (375, 61) with width 92 and height 102.
; PLAN: r0=375(x), r1=61(y), r2=92(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 61
LDI r2, 92
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
