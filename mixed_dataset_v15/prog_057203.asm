; DESCRIPTION: Draws a cyan rectangle at (477, 123) with width 35 and height 119.
; PLAN: r0=477(x), r1=123(y), r2=35(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 123
LDI r2, 35
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
