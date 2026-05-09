; DESCRIPTION: Draws a cyan rectangle at (232, 31) with width 13 and height 92.
; PLAN: r0=232(x), r1=31(y), r2=13(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 31
LDI r2, 13
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
