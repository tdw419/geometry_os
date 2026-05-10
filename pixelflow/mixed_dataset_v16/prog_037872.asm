; DESCRIPTION: Draws a cyan rectangle at (137, 14) with width 99 and height 55.
; PLAN: r0=137(x), r1=14(y), r2=99(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 14
LDI r2, 99
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
