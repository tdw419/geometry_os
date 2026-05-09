; DESCRIPTION: Draws a white rectangle at (4, 122) with width 44 and height 114.
; PLAN: r0=4(x), r1=122(y), r2=44(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 122
LDI r2, 44
LDI r3, 114
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
