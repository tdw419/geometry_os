; DESCRIPTION: Draws a cyan rectangle at (117, 19) with width 110 and height 115.
; PLAN: r0=117(x), r1=19(y), r2=110(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 19
LDI r2, 110
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
