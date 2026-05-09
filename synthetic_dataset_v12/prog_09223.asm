; DESCRIPTION: Draws a red rectangle at (25, 135) with width 56 and height 20.
; PLAN: r0=25(x), r1=135(y), r2=56(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 135
LDI r2, 56
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
