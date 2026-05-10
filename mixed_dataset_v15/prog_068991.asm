; DESCRIPTION: Draws a purple rectangle at (458, 91) with width 23 and height 47.
; PLAN: r0=458(x), r1=91(y), r2=23(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 91
LDI r2, 23
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
