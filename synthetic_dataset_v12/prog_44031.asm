; DESCRIPTION: Draws a yellow rectangle at (179, 4) with width 76 and height 53.
; PLAN: r0=179(x), r1=4(y), r2=76(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 4
LDI r2, 76
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
