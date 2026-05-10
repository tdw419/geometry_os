; DESCRIPTION: Draws a cyan rectangle at (140, 66) with width 74 and height 96.
; PLAN: r0=140(x), r1=66(y), r2=74(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 66
LDI r2, 74
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
