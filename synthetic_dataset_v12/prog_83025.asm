; DESCRIPTION: Draws a white rectangle at (391, 142) with width 110 and height 69.
; PLAN: r0=391(x), r1=142(y), r2=110(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 142
LDI r2, 110
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
