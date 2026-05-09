; DESCRIPTION: Draws a purple rectangle at (228, 190) with width 29 and height 30.
; PLAN: r0=228(x), r1=190(y), r2=29(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 190
LDI r2, 29
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
