; DESCRIPTION: Draws a black rectangle at (49, 59) with width 37 and height 20.
; PLAN: r0=49(x), r1=59(y), r2=37(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 59
LDI r2, 37
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
