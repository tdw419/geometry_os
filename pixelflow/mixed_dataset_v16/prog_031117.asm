; DESCRIPTION: Draws a cyan rectangle at (13, 19) with width 89 and height 82.
; PLAN: r0=13(x), r1=19(y), r2=89(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 19
LDI r2, 89
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
