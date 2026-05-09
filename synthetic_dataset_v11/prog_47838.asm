; DESCRIPTION: Draws a white rectangle at (170, 65) with width 28 and height 77.
; PLAN: r0=170(x), r1=65(y), r2=28(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 65
LDI r2, 28
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
