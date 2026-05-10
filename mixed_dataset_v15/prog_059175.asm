; DESCRIPTION: Draws a white rectangle at (388, 142) with width 117 and height 25.
; PLAN: r0=388(x), r1=142(y), r2=117(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 142
LDI r2, 117
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
