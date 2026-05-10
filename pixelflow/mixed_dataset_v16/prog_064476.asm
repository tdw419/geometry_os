; DESCRIPTION: Draws a red rectangle at (440, 138) with width 29 and height 90.
; PLAN: r0=440(x), r1=138(y), r2=29(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 138
LDI r2, 29
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
