; DESCRIPTION: Draws a black rectangle at (44, 124) with width 102 and height 78.
; PLAN: r0=44(x), r1=124(y), r2=102(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 124
LDI r2, 102
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
