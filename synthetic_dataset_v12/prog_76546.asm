; DESCRIPTION: Draws a blue rectangle at (186, 201) with width 68 and height 36.
; PLAN: r0=186(x), r1=201(y), r2=68(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 201
LDI r2, 68
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
