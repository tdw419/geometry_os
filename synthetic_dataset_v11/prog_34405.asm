; DESCRIPTION: Draws a yellow rectangle at (147, 47) with width 49 and height 61.
; PLAN: r0=147(x), r1=47(y), r2=49(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 47
LDI r2, 49
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
