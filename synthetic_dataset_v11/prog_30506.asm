; DESCRIPTION: Draws a purple rectangle at (189, 16) with width 33 and height 12.
; PLAN: r0=189(x), r1=16(y), r2=33(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 16
LDI r2, 33
LDI r3, 12
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
