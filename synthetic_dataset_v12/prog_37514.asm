; DESCRIPTION: Draws a white rectangle at (37, 69) with width 117 and height 68.
; PLAN: r0=37(x), r1=69(y), r2=117(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 69
LDI r2, 117
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
