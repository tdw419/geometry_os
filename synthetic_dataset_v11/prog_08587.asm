; DESCRIPTION: Draws a green rectangle at (167, 71) with width 33 and height 15.
; PLAN: r0=167(x), r1=71(y), r2=33(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 71
LDI r2, 33
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
