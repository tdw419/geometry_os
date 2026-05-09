; DESCRIPTION: Draws a purple rectangle at (213, 59) with width 12 and height 77.
; PLAN: r0=213(x), r1=59(y), r2=12(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 59
LDI r2, 12
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
