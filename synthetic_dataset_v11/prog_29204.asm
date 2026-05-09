; DESCRIPTION: Draws a cyan rectangle at (17, 24) with width 35 and height 82.
; PLAN: r0=17(x), r1=24(y), r2=35(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 24
LDI r2, 35
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
