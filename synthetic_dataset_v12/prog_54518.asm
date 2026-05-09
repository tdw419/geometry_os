; DESCRIPTION: Draws a red rectangle at (144, 147) with width 103 and height 101.
; PLAN: r0=144(x), r1=147(y), r2=103(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 147
LDI r2, 103
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
