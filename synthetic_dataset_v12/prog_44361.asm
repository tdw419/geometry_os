; DESCRIPTION: Draws a purple rectangle at (280, 123) with width 111 and height 103.
; PLAN: r0=280(x), r1=123(y), r2=111(width), r3=103(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 123
LDI r2, 111
LDI r3, 103
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
