; DESCRIPTION: Draws a green rectangle at (6, 126) with width 50 and height 38.
; PLAN: r0=6(x), r1=126(y), r2=50(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 126
LDI r2, 50
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
