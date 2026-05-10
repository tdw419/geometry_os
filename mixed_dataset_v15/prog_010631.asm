; DESCRIPTION: Draws a green rectangle at (98, 30) with width 77 and height 15.
; PLAN: r0=98(x), r1=30(y), r2=77(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 30
LDI r2, 77
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
