; DESCRIPTION: Draws a cyan rectangle at (177, 37) with width 49 and height 11.
; PLAN: r0=177(x), r1=37(y), r2=49(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 37
LDI r2, 49
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
