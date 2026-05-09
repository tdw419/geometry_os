; DESCRIPTION: Draws a red rectangle at (157, 53) with width 25 and height 79.
; PLAN: r0=157(x), r1=53(y), r2=25(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 53
LDI r2, 25
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
