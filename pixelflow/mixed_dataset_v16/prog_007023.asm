; DESCRIPTION: Draws a blue rectangle at (217, 125) with width 83 and height 77.
; PLAN: r0=217(x), r1=125(y), r2=83(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 125
LDI r2, 83
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
