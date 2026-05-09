; DESCRIPTION: Draws a purple rectangle at (78, 59) with width 62 and height 27.
; PLAN: r0=78(x), r1=59(y), r2=62(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 59
LDI r2, 62
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
