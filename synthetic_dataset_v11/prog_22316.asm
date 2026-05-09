; DESCRIPTION: Draws a white rectangle at (177, 154) with width 37 and height 13.
; PLAN: r0=177(x), r1=154(y), r2=37(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 154
LDI r2, 37
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
