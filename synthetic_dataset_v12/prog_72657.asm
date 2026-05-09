; DESCRIPTION: Draws a red rectangle at (276, 64) with width 22 and height 110.
; PLAN: r0=276(x), r1=64(y), r2=22(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 64
LDI r2, 22
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
