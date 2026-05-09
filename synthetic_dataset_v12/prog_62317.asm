; DESCRIPTION: Draws a white rectangle at (170, 4) with width 63 and height 114.
; PLAN: r0=170(x), r1=4(y), r2=63(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 4
LDI r2, 63
LDI r3, 114
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
