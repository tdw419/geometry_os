; DESCRIPTION: Draws a red rectangle at (79, 29) with width 19 and height 100.
; PLAN: r0=79(x), r1=29(y), r2=19(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 29
LDI r2, 19
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
