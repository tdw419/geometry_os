; DESCRIPTION: Draws a purple rectangle at (197, 72) with width 21 and height 111.
; PLAN: r0=197(x), r1=72(y), r2=21(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 72
LDI r2, 21
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
