; DESCRIPTION: Draws a red rectangle at (139, 174) with width 11 and height 62.
; PLAN: r0=139(x), r1=174(y), r2=11(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 174
LDI r2, 11
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
