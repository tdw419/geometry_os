; DESCRIPTION: Draws a cyan rectangle at (139, 182) with width 38 and height 43.
; PLAN: r0=139(x), r1=182(y), r2=38(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 182
LDI r2, 38
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
