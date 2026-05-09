; DESCRIPTION: Draws a purple rectangle at (467, 45) with width 45 and height 74.
; PLAN: r0=467(x), r1=45(y), r2=45(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 45
LDI r2, 45
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
