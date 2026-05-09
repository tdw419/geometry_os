; DESCRIPTION: Draws a red rectangle at (254, 139) with width 24 and height 13.
; PLAN: r0=254(x), r1=139(y), r2=24(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 139
LDI r2, 24
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
