; DESCRIPTION: Draws a purple rectangle at (16, 32) with width 47 and height 112.
; PLAN: r0=16(x), r1=32(y), r2=47(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 32
LDI r2, 47
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
