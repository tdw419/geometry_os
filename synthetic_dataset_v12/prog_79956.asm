; DESCRIPTION: Draws a red rectangle at (88, 147) with width 86 and height 32.
; PLAN: r0=88(x), r1=147(y), r2=86(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 147
LDI r2, 86
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
