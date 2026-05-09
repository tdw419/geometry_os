; DESCRIPTION: Draws a white rectangle at (319, 11) with width 77 and height 98.
; PLAN: r0=319(x), r1=11(y), r2=77(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 11
LDI r2, 77
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
