; DESCRIPTION: Draws a white rectangle at (350, 114) with width 113 and height 109.
; PLAN: r0=350(x), r1=114(y), r2=113(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 114
LDI r2, 113
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
