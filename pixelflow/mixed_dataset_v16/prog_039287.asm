; DESCRIPTION: Draws a black rectangle at (102, 6) with width 62 and height 65.
; PLAN: r0=102(x), r1=6(y), r2=62(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 6
LDI r2, 62
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
