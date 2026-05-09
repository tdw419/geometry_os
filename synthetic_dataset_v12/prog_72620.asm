; DESCRIPTION: Draws a purple rectangle at (238, 186) with width 113 and height 15.
; PLAN: r0=238(x), r1=186(y), r2=113(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 186
LDI r2, 113
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
