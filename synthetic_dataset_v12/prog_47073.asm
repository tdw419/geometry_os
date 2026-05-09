; DESCRIPTION: Draws a blue rectangle at (172, 190) with width 29 and height 26.
; PLAN: r0=172(x), r1=190(y), r2=29(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 190
LDI r2, 29
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
