; DESCRIPTION: Draws a cyan rectangle at (266, 26) with width 14 and height 65.
; PLAN: r0=266(x), r1=26(y), r2=14(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 26
LDI r2, 14
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
