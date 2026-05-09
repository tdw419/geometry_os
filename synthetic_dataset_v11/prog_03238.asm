; DESCRIPTION: Draws a yellow rectangle at (19, 92) with width 39 and height 108.
; PLAN: r0=19(x), r1=92(y), r2=39(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 92
LDI r2, 39
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
