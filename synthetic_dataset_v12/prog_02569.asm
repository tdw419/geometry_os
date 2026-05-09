; DESCRIPTION: Draws a cyan rectangle at (174, 123) with width 88 and height 115.
; PLAN: r0=174(x), r1=123(y), r2=88(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 123
LDI r2, 88
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
