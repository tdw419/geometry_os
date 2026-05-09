; DESCRIPTION: Draws a black rectangle at (59, 2) with width 33 and height 62.
; PLAN: r0=59(x), r1=2(y), r2=33(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 2
LDI r2, 33
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
