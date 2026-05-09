; DESCRIPTION: Draws a purple rectangle at (171, 10) with width 15 and height 13.
; PLAN: r0=171(x), r1=10(y), r2=15(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 10
LDI r2, 15
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
