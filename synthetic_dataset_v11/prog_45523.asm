; DESCRIPTION: Draws a cyan rectangle at (119, 113) with width 39 and height 106.
; PLAN: r0=119(x), r1=113(y), r2=39(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 113
LDI r2, 39
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
