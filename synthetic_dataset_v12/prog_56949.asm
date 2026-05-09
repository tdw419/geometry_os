; DESCRIPTION: Draws a green rectangle at (167, 10) with width 19 and height 39.
; PLAN: r0=167(x), r1=10(y), r2=19(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 10
LDI r2, 19
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
