; DESCRIPTION: Draws a black rectangle at (466, 10) with width 26 and height 53.
; PLAN: r0=466(x), r1=10(y), r2=26(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 10
LDI r2, 26
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
