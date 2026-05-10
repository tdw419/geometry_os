; DESCRIPTION: Draws a red rectangle at (352, 156) with width 117 and height 100.
; PLAN: r0=352(x), r1=156(y), r2=117(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 156
LDI r2, 117
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
