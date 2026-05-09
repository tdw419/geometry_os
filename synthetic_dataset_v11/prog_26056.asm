; DESCRIPTION: Draws a purple rectangle at (112, 111) with width 12 and height 103.
; PLAN: r0=112(x), r1=111(y), r2=12(width), r3=103(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 111
LDI r2, 12
LDI r3, 103
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
