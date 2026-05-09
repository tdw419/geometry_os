; DESCRIPTION: Draws a purple rectangle at (2, 154) with width 64 and height 36.
; PLAN: r0=2(x), r1=154(y), r2=64(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 154
LDI r2, 64
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
