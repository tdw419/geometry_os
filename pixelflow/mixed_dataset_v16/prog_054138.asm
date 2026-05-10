; DESCRIPTION: Draws a cyan rectangle at (232, 163) with width 46 and height 38.
; PLAN: r0=232(x), r1=163(y), r2=46(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 163
LDI r2, 46
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
