; DESCRIPTION: Draws a black rectangle at (458, 115) with width 49 and height 85.
; PLAN: r0=458(x), r1=115(y), r2=49(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 115
LDI r2, 49
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
