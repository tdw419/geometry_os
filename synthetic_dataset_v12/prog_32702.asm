; DESCRIPTION: Draws a purple rectangle at (327, 21) with width 102 and height 85.
; PLAN: r0=327(x), r1=21(y), r2=102(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 21
LDI r2, 102
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
