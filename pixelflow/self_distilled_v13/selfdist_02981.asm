; DESCRIPTION: Draws a purple rectangle at (239, 2) with width 93 and height 12.
; PLAN: r0=239(x), r1=2(y), r2=93(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 2
LDI r2, 93
LDI r3, 12
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
