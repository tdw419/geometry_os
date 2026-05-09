; DESCRIPTION: Draws a cyan rectangle at (153, 14) with width 19 and height 115.
; PLAN: r0=153(x), r1=14(y), r2=19(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 14
LDI r2, 19
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
