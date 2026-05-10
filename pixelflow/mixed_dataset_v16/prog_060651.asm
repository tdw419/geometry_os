; DESCRIPTION: Draws a yellow rectangle at (143, 40) with width 89 and height 47.
; PLAN: r0=143(x), r1=40(y), r2=89(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 40
LDI r2, 89
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
