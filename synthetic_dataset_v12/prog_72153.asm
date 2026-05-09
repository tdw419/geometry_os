; DESCRIPTION: Draws a black rectangle at (29, 109) with width 89 and height 28.
; PLAN: r0=29(x), r1=109(y), r2=89(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 109
LDI r2, 89
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
