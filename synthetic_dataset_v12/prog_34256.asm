; DESCRIPTION: Draws a purple rectangle at (330, 98) with width 111 and height 59.
; PLAN: r0=330(x), r1=98(y), r2=111(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 98
LDI r2, 111
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
