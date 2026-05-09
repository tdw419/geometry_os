; DESCRIPTION: Draws a purple rectangle at (308, 157) with width 82 and height 71.
; PLAN: r0=308(x), r1=157(y), r2=82(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 157
LDI r2, 82
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
