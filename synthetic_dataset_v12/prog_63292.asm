; DESCRIPTION: Draws a purple rectangle at (109, 50) with width 34 and height 27.
; PLAN: r0=109(x), r1=50(y), r2=34(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 50
LDI r2, 34
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
