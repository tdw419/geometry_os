; DESCRIPTION: Draws a green rectangle at (181, 147) with width 67 and height 16.
; PLAN: r0=181(x), r1=147(y), r2=67(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 147
LDI r2, 67
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
