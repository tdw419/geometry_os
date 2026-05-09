; DESCRIPTION: Draws a purple rectangle at (245, 164) with width 102 and height 34.
; PLAN: r0=245(x), r1=164(y), r2=102(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 164
LDI r2, 102
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
