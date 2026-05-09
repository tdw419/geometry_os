; DESCRIPTION: Draws a white rectangle at (133, 187) with width 37 and height 69.
; PLAN: r0=133(x), r1=187(y), r2=37(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 187
LDI r2, 37
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
