; DESCRIPTION: Draws a red rectangle at (157, 2) with width 55 and height 49.
; PLAN: r0=157(x), r1=2(y), r2=55(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 2
LDI r2, 55
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
