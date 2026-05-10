; DESCRIPTION: Draws a yellow rectangle at (376, 171) with width 51 and height 36.
; PLAN: r0=376(x), r1=171(y), r2=51(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 171
LDI r2, 51
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
