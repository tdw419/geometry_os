; DESCRIPTION: Draws a purple rectangle at (173, 28) with width 17 and height 48.
; PLAN: r0=173(x), r1=28(y), r2=17(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 28
LDI r2, 17
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
