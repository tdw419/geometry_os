; DESCRIPTION: Draws a green rectangle at (2, 87) with width 81 and height 109.
; PLAN: r0=2(x), r1=87(y), r2=81(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 87
LDI r2, 81
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
