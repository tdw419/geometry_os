; DESCRIPTION: Draws a green rectangle at (183, 12) with width 56 and height 10.
; PLAN: r0=183(x), r1=12(y), r2=56(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 12
LDI r2, 56
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
