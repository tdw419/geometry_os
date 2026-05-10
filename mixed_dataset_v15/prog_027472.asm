; DESCRIPTION: Draws a cyan rectangle at (266, 118) with width 108 and height 86.
; PLAN: r0=266(x), r1=118(y), r2=108(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 118
LDI r2, 108
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
