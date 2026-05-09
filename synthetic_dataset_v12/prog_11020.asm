; DESCRIPTION: Draws a black rectangle at (428, 177) with width 38 and height 55.
; PLAN: r0=428(x), r1=177(y), r2=38(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 177
LDI r2, 38
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
