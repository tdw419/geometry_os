; DESCRIPTION: Draws a white rectangle at (8, 167) with width 36 and height 44.
; PLAN: r0=8(x), r1=167(y), r2=36(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 167
LDI r2, 36
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
