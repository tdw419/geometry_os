; DESCRIPTION: Draws a red rectangle at (69, 184) with width 73 and height 45.
; PLAN: r0=69(x), r1=184(y), r2=73(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 184
LDI r2, 73
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
