; DESCRIPTION: Draws a purple rectangle at (434, 33) with width 43 and height 100.
; PLAN: r0=434(x), r1=33(y), r2=43(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 33
LDI r2, 43
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
