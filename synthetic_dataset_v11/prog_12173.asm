; DESCRIPTION: Draws a green rectangle at (97, 141) with width 64 and height 77.
; PLAN: r0=97(x), r1=141(y), r2=64(width), r3=77(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 141
LDI r2, 64
LDI r3, 77
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
