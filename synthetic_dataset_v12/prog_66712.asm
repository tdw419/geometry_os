; DESCRIPTION: Draws a purple rectangle at (307, 175) with width 92 and height 44.
; PLAN: r0=307(x), r1=175(y), r2=92(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 175
LDI r2, 92
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
