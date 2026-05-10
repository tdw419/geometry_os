; DESCRIPTION: Draws a red rectangle at (70, 115) with width 106 and height 29.
; PLAN: r0=70(x), r1=115(y), r2=106(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 115
LDI r2, 106
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
