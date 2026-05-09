; DESCRIPTION: Draws a purple rectangle at (247, 143) with width 94 and height 16.
; PLAN: r0=247(x), r1=143(y), r2=94(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 143
LDI r2, 94
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
