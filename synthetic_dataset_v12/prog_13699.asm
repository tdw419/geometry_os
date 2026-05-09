; DESCRIPTION: Draws a black rectangle at (345, 190) with width 56 and height 53.
; PLAN: r0=345(x), r1=190(y), r2=56(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 190
LDI r2, 56
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
