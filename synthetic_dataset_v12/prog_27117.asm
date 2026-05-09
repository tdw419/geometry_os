; DESCRIPTION: Draws a cyan rectangle at (17, 190) with width 24 and height 62.
; PLAN: r0=17(x), r1=190(y), r2=24(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 190
LDI r2, 24
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
