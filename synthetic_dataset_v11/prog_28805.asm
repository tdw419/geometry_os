; DESCRIPTION: Draws a red rectangle at (69, 118) with width 110 and height 79.
; PLAN: r0=69(x), r1=118(y), r2=110(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 118
LDI r2, 110
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
