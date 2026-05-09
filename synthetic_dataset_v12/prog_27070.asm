; DESCRIPTION: Draws a green rectangle at (72, 126) with width 12 and height 26.
; PLAN: r0=72(x), r1=126(y), r2=12(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 126
LDI r2, 12
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
