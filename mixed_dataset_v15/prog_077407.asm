; DESCRIPTION: Draws a red rectangle at (375, 19) with width 81 and height 100.
; PLAN: r0=375(x), r1=19(y), r2=81(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 19
LDI r2, 81
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
