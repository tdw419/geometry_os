; DESCRIPTION: Draws a blue rectangle at (190, 72) with width 49 and height 117.
; PLAN: r0=190(x), r1=72(y), r2=49(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 72
LDI r2, 49
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
