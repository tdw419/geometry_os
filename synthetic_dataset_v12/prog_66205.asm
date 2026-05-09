; DESCRIPTION: Draws a purple rectangle at (151, 0) with width 117 and height 61.
; PLAN: r0=151(x), r1=0(y), r2=117(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 0
LDI r2, 117
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
