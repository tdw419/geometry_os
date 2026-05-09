; DESCRIPTION: Draws a red rectangle at (110, 121) with width 14 and height 110.
; PLAN: r0=110(x), r1=121(y), r2=14(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 121
LDI r2, 14
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
