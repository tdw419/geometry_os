; DESCRIPTION: Draws a purple rectangle at (425, 125) with width 45 and height 90.
; PLAN: r0=425(x), r1=125(y), r2=45(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 125
LDI r2, 45
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
