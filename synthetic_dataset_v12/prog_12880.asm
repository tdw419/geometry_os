; DESCRIPTION: Draws a cyan rectangle at (343, 58) with width 84 and height 40.
; PLAN: r0=343(x), r1=58(y), r2=84(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 58
LDI r2, 84
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
