; DESCRIPTION: Draws a white rectangle at (127, 155) with width 113 and height 24.
; PLAN: r0=127(x), r1=155(y), r2=113(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 155
LDI r2, 113
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
