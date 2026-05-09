; DESCRIPTION: Draws a green rectangle at (126, 68) with width 89 and height 28.
; PLAN: r0=126(x), r1=68(y), r2=89(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 68
LDI r2, 89
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
