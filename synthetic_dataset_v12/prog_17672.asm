; DESCRIPTION: Draws a green rectangle at (80, 151) with width 67 and height 89.
; PLAN: r0=80(x), r1=151(y), r2=67(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 151
LDI r2, 67
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
