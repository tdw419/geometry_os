; DESCRIPTION: Draws a cyan rectangle at (157, 123) with width 10 and height 29.
; PLAN: r0=157(x), r1=123(y), r2=10(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 123
LDI r2, 10
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
