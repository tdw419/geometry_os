; DESCRIPTION: Draws a green rectangle at (190, 117) with width 82 and height 118.
; PLAN: r0=190(x), r1=117(y), r2=82(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 117
LDI r2, 82
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
