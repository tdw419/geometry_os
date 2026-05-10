; DESCRIPTION: Draws a red rectangle at (304, 156) with width 66 and height 74.
; PLAN: r0=304(x), r1=156(y), r2=66(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 156
LDI r2, 66
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
