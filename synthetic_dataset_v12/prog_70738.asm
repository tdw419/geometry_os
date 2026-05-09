; DESCRIPTION: Draws a white rectangle at (329, 54) with width 69 and height 101.
; PLAN: r0=329(x), r1=54(y), r2=69(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 54
LDI r2, 69
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
