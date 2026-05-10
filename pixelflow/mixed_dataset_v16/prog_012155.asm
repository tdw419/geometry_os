; DESCRIPTION: Draws a black rectangle at (283, 150) with width 92 and height 36.
; PLAN: r0=283(x), r1=150(y), r2=92(width), r3=36(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 150
LDI r2, 92
LDI r3, 36
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
