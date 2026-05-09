; DESCRIPTION: Draws a blue rectangle at (1, 124) with width 107 and height 14.
; PLAN: r0=1(x), r1=124(y), r2=107(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 124
LDI r2, 107
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
