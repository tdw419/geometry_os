; DESCRIPTION: Draws a red rectangle at (137, 160) with width 115 and height 95.
; PLAN: r0=137(x), r1=160(y), r2=115(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 160
LDI r2, 115
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
