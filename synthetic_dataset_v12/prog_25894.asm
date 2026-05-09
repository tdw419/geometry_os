; DESCRIPTION: Draws a purple rectangle at (127, 48) with width 32 and height 20.
; PLAN: r0=127(x), r1=48(y), r2=32(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 48
LDI r2, 32
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
