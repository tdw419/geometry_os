; DESCRIPTION: Draws a cyan rectangle at (316, 9) with width 29 and height 45.
; PLAN: r0=316(x), r1=9(y), r2=29(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 9
LDI r2, 29
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
