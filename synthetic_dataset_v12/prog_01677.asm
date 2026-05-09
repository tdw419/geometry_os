; DESCRIPTION: Draws a purple rectangle at (320, 207) with width 86 and height 36.
; PLAN: r0=320(x), r1=207(y), r2=86(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 207
LDI r2, 86
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
