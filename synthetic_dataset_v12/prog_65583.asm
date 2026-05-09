; DESCRIPTION: Draws a red rectangle at (4, 134) with width 100 and height 29.
; PLAN: r0=4(x), r1=134(y), r2=100(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 134
LDI r2, 100
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
