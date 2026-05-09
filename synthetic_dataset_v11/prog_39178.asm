; DESCRIPTION: Draws a green rectangle at (177, 138) with width 50 and height 76.
; PLAN: r0=177(x), r1=138(y), r2=50(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 138
LDI r2, 50
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
