; DESCRIPTION: Draws a black rectangle at (92, 147) with width 93 and height 86.
; PLAN: r0=92(x), r1=147(y), r2=93(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 147
LDI r2, 93
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
