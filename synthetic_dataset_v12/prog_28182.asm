; DESCRIPTION: Draws a black rectangle at (401, 132) with width 67 and height 86.
; PLAN: r0=401(x), r1=132(y), r2=67(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 132
LDI r2, 67
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
