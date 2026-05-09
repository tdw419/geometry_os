; DESCRIPTION: Draws a red rectangle at (2, 38) with width 66 and height 115.
; PLAN: r0=2(x), r1=38(y), r2=66(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 38
LDI r2, 66
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
