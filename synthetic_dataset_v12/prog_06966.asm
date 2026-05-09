; DESCRIPTION: Draws a cyan rectangle at (37, 2) with width 117 and height 110.
; PLAN: r0=37(x), r1=2(y), r2=117(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 2
LDI r2, 117
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
