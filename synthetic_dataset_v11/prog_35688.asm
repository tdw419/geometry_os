; DESCRIPTION: Draws a cyan rectangle at (144, 49) with width 100 and height 29.
; PLAN: r0=144(x), r1=49(y), r2=100(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 49
LDI r2, 100
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
