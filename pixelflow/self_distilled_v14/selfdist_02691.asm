; DESCRIPTION: Draws a red rectangle at (19, 124) with width 110 and height 74.
; PLAN: r0=19(x), r1=124(y), r2=110(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 124
LDI r2, 110
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
