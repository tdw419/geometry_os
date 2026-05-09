; DESCRIPTION: Draws a purple rectangle at (82, 101) with width 93 and height 93.
; PLAN: r0=82(x), r1=101(y), r2=93(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 101
LDI r2, 93
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
