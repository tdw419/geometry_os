; DESCRIPTION: Draws a purple rectangle at (168, 4) with width 64 and height 33.
; PLAN: r0=168(x), r1=4(y), r2=64(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 4
LDI r2, 64
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
