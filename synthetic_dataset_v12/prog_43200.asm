; DESCRIPTION: Draws a cyan rectangle at (43, 18) with width 102 and height 26.
; PLAN: r0=43(x), r1=18(y), r2=102(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 18
LDI r2, 102
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
