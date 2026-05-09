; DESCRIPTION: Draws a green rectangle at (334, 142) with width 44 and height 112.
; PLAN: r0=334(x), r1=142(y), r2=44(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 142
LDI r2, 44
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
