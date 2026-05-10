; DESCRIPTION: Draws a green rectangle at (100, 103) with width 100 and height 97.
; PLAN: r0=100(x), r1=103(y), r2=100(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 103
LDI r2, 100
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
