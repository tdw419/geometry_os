; DESCRIPTION: Draws a cyan rectangle at (147, 83) with width 92 and height 60.
; PLAN: r0=147(x), r1=83(y), r2=92(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 83
LDI r2, 92
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
