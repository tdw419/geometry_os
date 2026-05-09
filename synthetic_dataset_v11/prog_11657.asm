; DESCRIPTION: Draws a red rectangle at (157, 139) with width 31 and height 95.
; PLAN: r0=157(x), r1=139(y), r2=31(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 139
LDI r2, 31
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
