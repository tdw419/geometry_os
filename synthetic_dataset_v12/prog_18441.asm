; DESCRIPTION: Draws a purple rectangle at (405, 78) with width 58 and height 102.
; PLAN: r0=405(x), r1=78(y), r2=58(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 78
LDI r2, 58
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
