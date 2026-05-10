; DESCRIPTION: Draws a purple rectangle at (241, 56) with width 59 and height 21.
; PLAN: r0=241(x), r1=56(y), r2=59(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 56
LDI r2, 59
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
