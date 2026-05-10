; DESCRIPTION: Draws a black rectangle at (284, 67) with width 79 and height 115.
; PLAN: r0=284(x), r1=67(y), r2=79(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 67
LDI r2, 79
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
