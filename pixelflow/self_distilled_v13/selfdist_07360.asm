; DESCRIPTION: Draws a cyan rectangle at (33, 147) with width 45 and height 107.
; PLAN: r0=33(x), r1=147(y), r2=45(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 147
LDI r2, 45
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
