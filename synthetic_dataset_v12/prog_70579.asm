; DESCRIPTION: Draws a red rectangle at (181, 121) with width 87 and height 95.
; PLAN: r0=181(x), r1=121(y), r2=87(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 121
LDI r2, 87
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
