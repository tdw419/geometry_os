; DESCRIPTION: Draws a cyan rectangle at (177, 90) with width 43 and height 107.
; PLAN: r0=177(x), r1=90(y), r2=43(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 90
LDI r2, 43
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
