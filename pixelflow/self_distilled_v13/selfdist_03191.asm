; DESCRIPTION: Draws a white rectangle at (69, 176) with width 29 and height 26.
; PLAN: r0=69(x), r1=176(y), r2=29(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 176
LDI r2, 29
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
