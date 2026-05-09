; DESCRIPTION: Draws a cyan rectangle at (170, 76) with width 98 and height 69.
; PLAN: r0=170(x), r1=76(y), r2=98(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 76
LDI r2, 98
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
