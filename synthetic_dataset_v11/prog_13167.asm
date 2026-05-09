; DESCRIPTION: Draws a cyan rectangle at (18, 122) with width 94 and height 95.
; PLAN: r0=18(x), r1=122(y), r2=94(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 122
LDI r2, 94
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
