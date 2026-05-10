; DESCRIPTION: Draws a black rectangle at (313, 36) with width 86 and height 119.
; PLAN: r0=313(x), r1=36(y), r2=86(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 36
LDI r2, 86
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
