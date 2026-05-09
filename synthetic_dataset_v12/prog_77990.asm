; DESCRIPTION: Draws a white rectangle at (316, 117) with width 48 and height 25.
; PLAN: r0=316(x), r1=117(y), r2=48(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 117
LDI r2, 48
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
