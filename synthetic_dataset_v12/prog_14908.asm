; DESCRIPTION: Draws a cyan rectangle at (270, 81) with width 34 and height 25.
; PLAN: r0=270(x), r1=81(y), r2=34(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 81
LDI r2, 34
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
