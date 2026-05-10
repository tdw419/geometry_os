; DESCRIPTION: Draws a blue rectangle at (165, 124) with width 105 and height 79.
; PLAN: r0=165(x), r1=124(y), r2=105(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 124
LDI r2, 105
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
