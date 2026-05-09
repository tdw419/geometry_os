; DESCRIPTION: Draws a green rectangle at (100, 27) with width 119 and height 61.
; PLAN: r0=100(x), r1=27(y), r2=119(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 27
LDI r2, 119
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
