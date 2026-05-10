; DESCRIPTION: Draws a purple rectangle at (207, 164) with width 37 and height 75.
; PLAN: r0=207(x), r1=164(y), r2=37(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 164
LDI r2, 37
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
