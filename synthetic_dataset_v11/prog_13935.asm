; DESCRIPTION: Draws a red rectangle at (25, 134) with width 15 and height 56.
; PLAN: r0=25(x), r1=134(y), r2=15(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 134
LDI r2, 15
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
