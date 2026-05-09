; DESCRIPTION: Draws a cyan rectangle at (142, 147) with width 106 and height 102.
; PLAN: r0=142(x), r1=147(y), r2=106(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 147
LDI r2, 106
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
