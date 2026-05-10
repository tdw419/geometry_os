; DESCRIPTION: Draws a cyan rectangle at (323, 147) with width 113 and height 51.
; PLAN: r0=323(x), r1=147(y), r2=113(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 147
LDI r2, 113
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
