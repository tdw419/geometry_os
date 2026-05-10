; DESCRIPTION: Draws a purple rectangle at (160, 168) with width 119 and height 32.
; PLAN: r0=160(x), r1=168(y), r2=119(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 168
LDI r2, 119
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
