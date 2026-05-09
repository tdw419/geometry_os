; DESCRIPTION: Draws a cyan rectangle at (4, 139) with width 16 and height 43.
; PLAN: r0=4(x), r1=139(y), r2=16(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 139
LDI r2, 16
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
