; DESCRIPTION: Draws a green rectangle at (81, 126) with width 59 and height 78.
; PLAN: r0=81(x), r1=126(y), r2=59(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 126
LDI r2, 59
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
