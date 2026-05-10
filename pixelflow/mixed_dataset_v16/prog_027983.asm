; DESCRIPTION: Draws a yellow rectangle at (117, 177) with width 44 and height 53.
; PLAN: r0=117(x), r1=177(y), r2=44(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 177
LDI r2, 44
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
