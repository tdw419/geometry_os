; DESCRIPTION: Draws a blue rectangle at (167, 57) with width 34 and height 26.
; PLAN: r0=167(x), r1=57(y), r2=34(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 57
LDI r2, 34
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
