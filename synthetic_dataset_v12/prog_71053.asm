; DESCRIPTION: Draws a purple rectangle at (80, 116) with width 93 and height 82.
; PLAN: r0=80(x), r1=116(y), r2=93(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 116
LDI r2, 93
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
