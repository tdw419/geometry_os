; DESCRIPTION: Draws a purple rectangle at (65, 143) with width 85 and height 85.
; PLAN: r0=65(x), r1=143(y), r2=85(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 143
LDI r2, 85
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
