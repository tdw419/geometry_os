; DESCRIPTION: Draws a green rectangle at (11, 77) with width 98 and height 46.
; PLAN: r0=11(x), r1=77(y), r2=98(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 77
LDI r2, 98
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
