; DESCRIPTION: Draws a red rectangle at (102, 54) with width 35 and height 31.
; PLAN: r0=102(x), r1=54(y), r2=35(width), r3=31(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 54
LDI r2, 35
LDI r3, 31
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
