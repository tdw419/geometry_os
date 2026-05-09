; DESCRIPTION: Draws a purple rectangle at (107, 163) with width 72 and height 82.
; PLAN: r0=107(x), r1=163(y), r2=72(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 163
LDI r2, 72
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
