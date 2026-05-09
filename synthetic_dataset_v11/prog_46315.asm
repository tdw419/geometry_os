; DESCRIPTION: Draws a yellow rectangle at (90, 122) with width 27 and height 33.
; PLAN: r0=90(x), r1=122(y), r2=27(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 122
LDI r2, 27
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
