; DESCRIPTION: Draws a red rectangle at (184, 175) with width 68 and height 60.
; PLAN: r0=184(x), r1=175(y), r2=68(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 175
LDI r2, 68
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
