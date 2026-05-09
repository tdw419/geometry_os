; DESCRIPTION: Draws a cyan rectangle at (177, 95) with width 106 and height 29.
; PLAN: r0=177(x), r1=95(y), r2=106(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 95
LDI r2, 106
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
