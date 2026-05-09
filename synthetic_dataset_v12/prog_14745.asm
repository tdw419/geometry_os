; DESCRIPTION: Draws a cyan rectangle at (43, 54) with width 88 and height 86.
; PLAN: r0=43(x), r1=54(y), r2=88(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 54
LDI r2, 88
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
