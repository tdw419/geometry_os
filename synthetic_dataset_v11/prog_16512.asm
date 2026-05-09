; DESCRIPTION: Draws a red rectangle at (19, 12) with width 74 and height 77.
; PLAN: r0=19(x), r1=12(y), r2=74(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 12
LDI r2, 74
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
