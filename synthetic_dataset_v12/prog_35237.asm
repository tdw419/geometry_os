; DESCRIPTION: Draws a green rectangle at (167, 11) with width 44 and height 16.
; PLAN: r0=167(x), r1=11(y), r2=44(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 11
LDI r2, 44
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
