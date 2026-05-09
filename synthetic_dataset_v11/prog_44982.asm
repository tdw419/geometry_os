; DESCRIPTION: Draws a purple rectangle at (126, 120) with width 96 and height 90.
; PLAN: r0=126(x), r1=120(y), r2=96(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 120
LDI r2, 96
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
