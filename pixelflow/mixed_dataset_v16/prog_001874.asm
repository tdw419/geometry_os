; DESCRIPTION: Draws a red rectangle at (81, 38) with width 55 and height 110.
; PLAN: r0=81(x), r1=38(y), r2=55(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 38
LDI r2, 55
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
