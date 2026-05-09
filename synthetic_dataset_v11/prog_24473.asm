; DESCRIPTION: Draws a cyan rectangle at (93, 43) with width 89 and height 76.
; PLAN: r0=93(x), r1=43(y), r2=89(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 43
LDI r2, 89
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
