; DESCRIPTION: Draws a cyan rectangle at (10, 175) with width 101 and height 78.
; PLAN: r0=10(x), r1=175(y), r2=101(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 175
LDI r2, 101
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
