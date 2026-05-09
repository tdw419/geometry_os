; DESCRIPTION: Draws a white rectangle at (125, 125) with width 84 and height 63.
; PLAN: r0=125(x), r1=125(y), r2=84(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 125
LDI r2, 84
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
