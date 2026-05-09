; DESCRIPTION: Draws a black rectangle at (429, 67) with width 79 and height 116.
; PLAN: r0=429(x), r1=67(y), r2=79(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 67
LDI r2, 79
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
