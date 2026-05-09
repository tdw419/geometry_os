; DESCRIPTION: Draws a blue rectangle at (27, 147) with width 92 and height 87.
; PLAN: r0=27(x), r1=147(y), r2=92(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 147
LDI r2, 92
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
