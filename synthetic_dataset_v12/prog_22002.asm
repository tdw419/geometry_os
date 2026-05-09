; DESCRIPTION: Draws a red rectangle at (292, 96) with width 19 and height 119.
; PLAN: r0=292(x), r1=96(y), r2=19(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 96
LDI r2, 19
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
