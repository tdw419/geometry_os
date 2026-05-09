; DESCRIPTION: Draws a cyan rectangle at (106, 76) with width 66 and height 53.
; PLAN: r0=106(x), r1=76(y), r2=66(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 76
LDI r2, 66
LDI r3, 53
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
