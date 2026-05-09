; DESCRIPTION: Draws a cyan rectangle at (144, 55) with width 19 and height 100.
; PLAN: r0=144(x), r1=55(y), r2=19(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 55
LDI r2, 19
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
