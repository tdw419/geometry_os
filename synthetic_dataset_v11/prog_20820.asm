; DESCRIPTION: Draws a cyan rectangle at (184, 139) with width 19 and height 70.
; PLAN: r0=184(x), r1=139(y), r2=19(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 139
LDI r2, 19
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
