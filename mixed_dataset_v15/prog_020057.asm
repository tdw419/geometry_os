; DESCRIPTION: Draws a green rectangle at (167, 126) with width 87 and height 37.
; PLAN: r0=167(x), r1=126(y), r2=87(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 126
LDI r2, 87
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
