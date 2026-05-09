; DESCRIPTION: Draws a purple rectangle at (372, 127) with width 72 and height 44.
; PLAN: r0=372(x), r1=127(y), r2=72(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 127
LDI r2, 72
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
