; DESCRIPTION: Draws a cyan rectangle at (205, 101) with width 49 and height 12.
; PLAN: r0=205(x), r1=101(y), r2=49(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 101
LDI r2, 49
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
