; DESCRIPTION: Draws a red rectangle at (129, 73) with width 35 and height 14.
; PLAN: r0=129(x), r1=73(y), r2=35(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 73
LDI r2, 35
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
