; DESCRIPTION: Draws a green rectangle at (113, 8) with width 110 and height 56.
; PLAN: r0=113(x), r1=8(y), r2=110(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 8
LDI r2, 110
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
