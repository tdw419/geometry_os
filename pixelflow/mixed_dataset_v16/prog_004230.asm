; DESCRIPTION: Draws a white rectangle at (474, 26) with width 29 and height 118.
; PLAN: r0=474(x), r1=26(y), r2=29(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 26
LDI r2, 29
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
