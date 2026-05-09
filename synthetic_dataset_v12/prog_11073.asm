; DESCRIPTION: Draws a purple rectangle at (267, 82) with width 21 and height 39.
; PLAN: r0=267(x), r1=82(y), r2=21(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 82
LDI r2, 21
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
