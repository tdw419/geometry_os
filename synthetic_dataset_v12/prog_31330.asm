; DESCRIPTION: Draws a yellow rectangle at (421, 35) with width 57 and height 108.
; PLAN: r0=421(x), r1=35(y), r2=57(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 35
LDI r2, 57
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
