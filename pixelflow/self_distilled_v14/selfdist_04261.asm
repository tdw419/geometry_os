; DESCRIPTION: Draws a purple rectangle at (304, 28) with width 25 and height 91.
; PLAN: r0=304(x), r1=28(y), r2=25(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 28
LDI r2, 25
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
