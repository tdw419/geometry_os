; DESCRIPTION: Draws a red rectangle at (177, 13) with width 43 and height 83.
; PLAN: r0=177(x), r1=13(y), r2=43(width), r3=83(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 13
LDI r2, 43
LDI r3, 83
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
