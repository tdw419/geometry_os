; DESCRIPTION: Draws a cyan rectangle at (158, 94) with width 51 and height 114.
; PLAN: r0=158(x), r1=94(y), r2=51(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 94
LDI r2, 51
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
