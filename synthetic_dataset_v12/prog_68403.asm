; DESCRIPTION: Draws a red rectangle at (252, 87) with width 105 and height 55.
; PLAN: r0=252(x), r1=87(y), r2=105(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 87
LDI r2, 105
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
