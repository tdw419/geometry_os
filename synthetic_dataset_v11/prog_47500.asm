; DESCRIPTION: Draws a green rectangle at (100, 143) with width 78 and height 18.
; PLAN: r0=100(x), r1=143(y), r2=78(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 143
LDI r2, 78
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
