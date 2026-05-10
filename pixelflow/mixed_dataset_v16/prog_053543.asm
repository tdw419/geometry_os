; DESCRIPTION: Draws a yellow rectangle at (389, 67) with width 46 and height 19.
; PLAN: r0=389(x), r1=67(y), r2=46(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 67
LDI r2, 46
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
