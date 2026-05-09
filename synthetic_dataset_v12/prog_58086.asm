; DESCRIPTION: Draws a blue rectangle at (118, 124) with width 99 and height 102.
; PLAN: r0=118(x), r1=124(y), r2=99(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 124
LDI r2, 99
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
