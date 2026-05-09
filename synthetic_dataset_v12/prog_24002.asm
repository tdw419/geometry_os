; DESCRIPTION: Draws a purple rectangle at (249, 126) with width 120 and height 36.
; PLAN: r0=249(x), r1=126(y), r2=120(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 126
LDI r2, 120
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
