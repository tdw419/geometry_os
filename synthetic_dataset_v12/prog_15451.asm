; DESCRIPTION: Draws a cyan rectangle at (273, 201) with width 60 and height 37.
; PLAN: r0=273(x), r1=201(y), r2=60(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 201
LDI r2, 60
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
