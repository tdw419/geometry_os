; DESCRIPTION: Draws a black rectangle at (30, 117) with width 32 and height 88.
; PLAN: r0=30(x), r1=117(y), r2=32(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 117
LDI r2, 32
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
