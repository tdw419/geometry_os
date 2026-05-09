; DESCRIPTION: Draws a purple rectangle at (354, 58) with width 82 and height 87.
; PLAN: r0=354(x), r1=58(y), r2=82(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 58
LDI r2, 82
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
