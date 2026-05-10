; DESCRIPTION: Draws a green rectangle at (201, 152) with width 43 and height 12.
; PLAN: r0=201(x), r1=152(y), r2=43(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 152
LDI r2, 43
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
