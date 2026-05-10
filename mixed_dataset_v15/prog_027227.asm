; DESCRIPTION: Draws a white rectangle at (11, 14) with width 98 and height 87.
; PLAN: r0=11(x), r1=14(y), r2=98(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 14
LDI r2, 98
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
