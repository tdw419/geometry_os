; DESCRIPTION: Draws a purple rectangle at (251, 24) with width 16 and height 72.
; PLAN: r0=251(x), r1=24(y), r2=16(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 24
LDI r2, 16
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
