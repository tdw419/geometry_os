; DESCRIPTION: Draws a green rectangle at (179, 90) with width 13 and height 87.
; PLAN: r0=179(x), r1=90(y), r2=13(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 90
LDI r2, 13
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
