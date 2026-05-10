; DESCRIPTION: Draws a purple rectangle at (173, 10) with width 77 and height 108.
; PLAN: r0=173(x), r1=10(y), r2=77(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 10
LDI r2, 77
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
