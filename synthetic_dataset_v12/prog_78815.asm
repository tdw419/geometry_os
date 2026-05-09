; DESCRIPTION: Draws a red rectangle at (70, 156) with width 100 and height 58.
; PLAN: r0=70(x), r1=156(y), r2=100(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 156
LDI r2, 100
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
