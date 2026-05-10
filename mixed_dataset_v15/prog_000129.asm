; DESCRIPTION: Draws a blue rectangle at (165, 124) with width 15 and height 25.
; PLAN: r0=165(x), r1=124(y), r2=15(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 124
LDI r2, 15
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
