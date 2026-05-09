; DESCRIPTION: Draws a purple rectangle at (405, 58) with width 94 and height 62.
; PLAN: r0=405(x), r1=58(y), r2=94(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 58
LDI r2, 94
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
