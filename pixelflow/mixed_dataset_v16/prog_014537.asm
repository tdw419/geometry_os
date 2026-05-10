; DESCRIPTION: Draws a green rectangle at (203, 196) with width 82 and height 23.
; PLAN: r0=203(x), r1=196(y), r2=82(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 196
LDI r2, 82
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
