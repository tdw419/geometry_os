; DESCRIPTION: Draws a cyan rectangle at (34, 17) with width 101 and height 94.
; PLAN: r0=34(x), r1=17(y), r2=101(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 17
LDI r2, 101
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
