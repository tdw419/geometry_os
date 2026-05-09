; DESCRIPTION: Draws a green rectangle at (151, 153) with width 90 and height 85.
; PLAN: r0=151(x), r1=153(y), r2=90(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 153
LDI r2, 90
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
