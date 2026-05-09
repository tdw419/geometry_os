; DESCRIPTION: Draws a cyan rectangle at (324, 139) with width 66 and height 80.
; PLAN: r0=324(x), r1=139(y), r2=66(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 139
LDI r2, 66
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
