; DESCRIPTION: Draws a white rectangle at (182, 106) with width 69 and height 23.
; PLAN: r0=182(x), r1=106(y), r2=69(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 106
LDI r2, 69
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
