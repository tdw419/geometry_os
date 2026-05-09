; DESCRIPTION: Draws a yellow rectangle at (143, 169) with width 92 and height 85.
; PLAN: r0=143(x), r1=169(y), r2=92(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 169
LDI r2, 92
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
