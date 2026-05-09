; DESCRIPTION: Draws a red rectangle at (138, 117) with width 29 and height 72.
; PLAN: r0=138(x), r1=117(y), r2=29(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 117
LDI r2, 29
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
