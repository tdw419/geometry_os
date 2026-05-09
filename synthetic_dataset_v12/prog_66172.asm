; DESCRIPTION: Draws a purple rectangle at (94, 173) with width 72 and height 80.
; PLAN: r0=94(x), r1=173(y), r2=72(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 173
LDI r2, 72
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
