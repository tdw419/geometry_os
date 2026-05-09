; DESCRIPTION: Draws a blue rectangle at (163, 124) with width 76 and height 98.
; PLAN: r0=163(x), r1=124(y), r2=76(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 124
LDI r2, 76
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
