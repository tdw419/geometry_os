; DESCRIPTION: Draws a cyan rectangle at (139, 32) with width 41 and height 12.
; PLAN: r0=139(x), r1=32(y), r2=41(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 32
LDI r2, 41
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
