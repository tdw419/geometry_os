; DESCRIPTION: Draws a yellow rectangle at (126, 134) with width 104 and height 77.
; PLAN: r0=126(x), r1=134(y), r2=104(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 134
LDI r2, 104
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
