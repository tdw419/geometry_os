; DESCRIPTION: Draws a white rectangle at (440, 102) with width 44 and height 81.
; PLAN: r0=440(x), r1=102(y), r2=44(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 102
LDI r2, 44
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
