; DESCRIPTION: Draws a purple rectangle at (305, 143) with width 89 and height 58.
; PLAN: r0=305(x), r1=143(y), r2=89(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 143
LDI r2, 89
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
