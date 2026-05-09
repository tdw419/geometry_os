; DESCRIPTION: Draws a purple rectangle at (434, 107) with width 72 and height 119.
; PLAN: r0=434(x), r1=107(y), r2=72(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 107
LDI r2, 72
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
