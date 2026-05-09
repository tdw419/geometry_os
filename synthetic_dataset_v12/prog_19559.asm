; DESCRIPTION: Draws a white rectangle at (140, 84) with width 51 and height 103.
; PLAN: r0=140(x), r1=84(y), r2=51(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 84
LDI r2, 51
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
