; DESCRIPTION: Draws a red rectangle at (349, 138) with width 35 and height 11.
; PLAN: r0=349(x), r1=138(y), r2=35(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 138
LDI r2, 35
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
