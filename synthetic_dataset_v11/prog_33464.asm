; DESCRIPTION: Draws a purple rectangle at (120, 108) with width 82 and height 112.
; PLAN: r0=120(x), r1=108(y), r2=82(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 108
LDI r2, 82
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
