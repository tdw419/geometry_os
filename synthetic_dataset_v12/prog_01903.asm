; DESCRIPTION: Draws a red rectangle at (311, 192) with width 67 and height 10.
; PLAN: r0=311(x), r1=192(y), r2=67(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 192
LDI r2, 67
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
