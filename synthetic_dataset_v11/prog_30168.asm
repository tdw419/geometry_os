; DESCRIPTION: Draws a purple rectangle at (168, 13) with width 31 and height 17.
; PLAN: r0=168(x), r1=13(y), r2=31(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 13
LDI r2, 31
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
