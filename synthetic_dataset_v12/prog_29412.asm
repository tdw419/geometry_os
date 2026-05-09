; DESCRIPTION: Draws a purple rectangle at (460, 2) with width 20 and height 47.
; PLAN: r0=460(x), r1=2(y), r2=20(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 2
LDI r2, 20
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
