; DESCRIPTION: Draws a red rectangle at (56, 25) with width 25 and height 74.
; PLAN: r0=56(x), r1=25(y), r2=25(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 25
LDI r2, 25
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
