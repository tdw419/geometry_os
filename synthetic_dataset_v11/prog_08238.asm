; DESCRIPTION: Draws a purple rectangle at (173, 141) with width 70 and height 97.
; PLAN: r0=173(x), r1=141(y), r2=70(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 141
LDI r2, 70
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
