; DESCRIPTION: Draws a cyan rectangle at (56, 139) with width 15 and height 27.
; PLAN: r0=56(x), r1=139(y), r2=15(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 139
LDI r2, 15
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
