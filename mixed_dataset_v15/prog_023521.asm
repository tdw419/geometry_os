; DESCRIPTION: Draws a red rectangle at (364, 172) with width 72 and height 110.
; PLAN: r0=364(x), r1=172(y), r2=72(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 172
LDI r2, 72
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
