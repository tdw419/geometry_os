; DESCRIPTION: Draws a cyan rectangle at (270, 44) with width 81 and height 110.
; PLAN: r0=270(x), r1=44(y), r2=81(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 44
LDI r2, 81
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
