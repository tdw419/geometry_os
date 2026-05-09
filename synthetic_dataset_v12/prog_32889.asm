; DESCRIPTION: Draws a cyan rectangle at (147, 213) with width 107 and height 19.
; PLAN: r0=147(x), r1=213(y), r2=107(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 213
LDI r2, 107
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
