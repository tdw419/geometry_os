; DESCRIPTION: Draws a black rectangle at (173, 67) with width 21 and height 49.
; PLAN: r0=173(x), r1=67(y), r2=21(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 67
LDI r2, 21
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
