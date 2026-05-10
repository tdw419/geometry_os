; DESCRIPTION: Draws a purple rectangle at (120, 111) with width 45 and height 114.
; PLAN: r0=120(x), r1=111(y), r2=45(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 111
LDI r2, 45
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
