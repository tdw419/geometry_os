; DESCRIPTION: Draws a cyan rectangle at (88, 122) with width 95 and height 27.
; PLAN: r0=88(x), r1=122(y), r2=95(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 122
LDI r2, 95
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
