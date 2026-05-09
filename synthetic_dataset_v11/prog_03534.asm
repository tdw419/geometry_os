; DESCRIPTION: Draws a green rectangle at (98, 201) with width 103 and height 27.
; PLAN: r0=98(x), r1=201(y), r2=103(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 201
LDI r2, 103
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
