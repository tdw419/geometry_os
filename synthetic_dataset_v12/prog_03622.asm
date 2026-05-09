; DESCRIPTION: Draws a red rectangle at (439, 12) with width 62 and height 68.
; PLAN: r0=439(x), r1=12(y), r2=62(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 12
LDI r2, 62
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
