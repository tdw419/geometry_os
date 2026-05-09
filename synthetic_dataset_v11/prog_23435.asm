; DESCRIPTION: Draws a green rectangle at (183, 69) with width 54 and height 87.
; PLAN: r0=183(x), r1=69(y), r2=54(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 69
LDI r2, 54
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
