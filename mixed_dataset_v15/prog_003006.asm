; DESCRIPTION: Draws a cyan rectangle at (119, 29) with width 73 and height 39.
; PLAN: r0=119(x), r1=29(y), r2=73(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 29
LDI r2, 73
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
