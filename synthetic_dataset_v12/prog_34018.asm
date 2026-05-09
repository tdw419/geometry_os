; DESCRIPTION: Draws a cyan rectangle at (1, 76) with width 54 and height 78.
; PLAN: r0=1(x), r1=76(y), r2=54(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 76
LDI r2, 54
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
