; DESCRIPTION: Draws a cyan rectangle at (217, 29) with width 18 and height 81.
; PLAN: r0=217(x), r1=29(y), r2=18(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 29
LDI r2, 18
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
