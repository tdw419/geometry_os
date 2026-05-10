; DESCRIPTION: Draws a purple rectangle at (21, 181) with width 120 and height 71.
; PLAN: r0=21(x), r1=181(y), r2=120(width), r3=71(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 181
LDI r2, 120
LDI r3, 71
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
