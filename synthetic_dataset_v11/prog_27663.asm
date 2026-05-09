; DESCRIPTION: Draws a yellow rectangle at (142, 77) with width 38 and height 38.
; PLAN: r0=142(x), r1=77(y), r2=38(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 77
LDI r2, 38
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
