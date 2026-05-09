; DESCRIPTION: Draws a black rectangle at (4, 218) with width 28 and height 29.
; PLAN: r0=4(x), r1=218(y), r2=28(width), r3=29(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 218
LDI r2, 28
LDI r3, 29
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
