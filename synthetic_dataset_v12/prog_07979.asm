; DESCRIPTION: Draws a cyan rectangle at (177, 179) with width 108 and height 18.
; PLAN: r0=177(x), r1=179(y), r2=108(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 179
LDI r2, 108
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
