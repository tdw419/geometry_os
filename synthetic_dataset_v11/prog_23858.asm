; DESCRIPTION: Draws a black rectangle at (72, 19) with width 61 and height 98.
; PLAN: r0=72(x), r1=19(y), r2=61(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 19
LDI r2, 61
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
