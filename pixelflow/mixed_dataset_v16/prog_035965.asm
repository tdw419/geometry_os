; DESCRIPTION: Draws a cyan rectangle at (139, 21) with width 98 and height 22.
; PLAN: r0=139(x), r1=21(y), r2=98(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 21
LDI r2, 98
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
