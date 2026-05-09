; DESCRIPTION: Draws a black rectangle at (44, 102) with width 108 and height 27.
; PLAN: r0=44(x), r1=102(y), r2=108(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 102
LDI r2, 108
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
