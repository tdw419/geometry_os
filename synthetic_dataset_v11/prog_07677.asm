; DESCRIPTION: Draws a cyan rectangle at (105, 35) with width 15 and height 66.
; PLAN: r0=105(x), r1=35(y), r2=15(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 35
LDI r2, 15
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
