; DESCRIPTION: Draws a yellow rectangle at (92, 99) with width 30 and height 87.
; PLAN: r0=92(x), r1=99(y), r2=30(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 99
LDI r2, 30
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
