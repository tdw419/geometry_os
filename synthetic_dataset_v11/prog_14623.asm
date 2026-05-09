; DESCRIPTION: Draws a cyan rectangle at (119, 44) with width 43 and height 90.
; PLAN: r0=119(x), r1=44(y), r2=43(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 44
LDI r2, 43
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
