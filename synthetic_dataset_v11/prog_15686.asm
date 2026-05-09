; DESCRIPTION: Draws a white rectangle at (47, 190) with width 119 and height 11.
; PLAN: r0=47(x), r1=190(y), r2=119(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 190
LDI r2, 119
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
