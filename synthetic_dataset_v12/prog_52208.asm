; DESCRIPTION: Draws a cyan rectangle at (227, 167) with width 81 and height 47.
; PLAN: r0=227(x), r1=167(y), r2=81(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 167
LDI r2, 81
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
