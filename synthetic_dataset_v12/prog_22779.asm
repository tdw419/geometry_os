; DESCRIPTION: Draws a blue rectangle at (271, 13) with width 73 and height 36.
; PLAN: r0=271(x), r1=13(y), r2=73(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 13
LDI r2, 73
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
