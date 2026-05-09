; DESCRIPTION: Draws a red rectangle at (12, 184) with width 68 and height 38.
; PLAN: r0=12(x), r1=184(y), r2=68(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 184
LDI r2, 68
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
