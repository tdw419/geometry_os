; DESCRIPTION: Draws a yellow rectangle at (389, 57) with width 102 and height 47.
; PLAN: r0=389(x), r1=57(y), r2=102(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 57
LDI r2, 102
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
