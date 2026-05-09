; DESCRIPTION: Draws a purple rectangle at (497, 125) with width 10 and height 30.
; PLAN: r0=497(x), r1=125(y), r2=10(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 125
LDI r2, 10
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
