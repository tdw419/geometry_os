; DESCRIPTION: Draws a green rectangle at (23, 69) with width 56 and height 115.
; PLAN: r0=23(x), r1=69(y), r2=56(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 69
LDI r2, 56
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
