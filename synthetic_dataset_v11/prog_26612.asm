; DESCRIPTION: Draws a red rectangle at (31, 22) with width 87 and height 38.
; PLAN: r0=31(x), r1=22(y), r2=87(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 22
LDI r2, 87
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
