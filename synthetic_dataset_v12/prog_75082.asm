; DESCRIPTION: Draws a purple rectangle at (412, 127) with width 98 and height 78.
; PLAN: r0=412(x), r1=127(y), r2=98(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 127
LDI r2, 98
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
