; DESCRIPTION: Draws a cyan rectangle at (114, 74) with width 18 and height 77.
; PLAN: r0=114(x), r1=74(y), r2=18(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 74
LDI r2, 18
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
