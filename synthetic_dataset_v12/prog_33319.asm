; DESCRIPTION: Draws a white rectangle at (190, 36) with width 87 and height 14.
; PLAN: r0=190(x), r1=36(y), r2=87(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 36
LDI r2, 87
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
