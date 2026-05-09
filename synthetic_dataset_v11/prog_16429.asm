; DESCRIPTION: Draws a green rectangle at (113, 11) with width 113 and height 18.
; PLAN: r0=113(x), r1=11(y), r2=113(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 11
LDI r2, 113
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
