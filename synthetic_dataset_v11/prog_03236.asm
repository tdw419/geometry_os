; DESCRIPTION: Draws a red rectangle at (62, 181) with width 110 and height 12.
; PLAN: r0=62(x), r1=181(y), r2=110(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 181
LDI r2, 110
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
