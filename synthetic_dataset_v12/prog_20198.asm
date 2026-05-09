; DESCRIPTION: Draws a cyan rectangle at (463, 66) with width 29 and height 77.
; PLAN: r0=463(x), r1=66(y), r2=29(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 66
LDI r2, 29
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
