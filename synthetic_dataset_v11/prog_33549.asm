; DESCRIPTION: Draws a cyan rectangle at (201, 66) with width 27 and height 118.
; PLAN: r0=201(x), r1=66(y), r2=27(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 66
LDI r2, 27
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
