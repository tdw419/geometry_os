; DESCRIPTION: Composite: . Then Draws a orange rectangle at (78, 188) with width 94 and height 63. Then Renders a black line between points (104, 51) and (249, 205).
; PLAN: r0=78(x), r1=188(y), r2=94(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=104(x1), r1=51(y1), r2=249(x2), r3=205(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a orange rectangle at (78, 188) with width 94 and height 63.
; PLAN: r0=78(x), r1=188(y), r2=94(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 188
LDI r2, 94
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a black line between points (104, 51) and (249, 205).
; PLAN: r0=104(x1), r1=51(y1), r2=249(x2), r3=205(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 51
LDI r2, 249
LDI r3, 205
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
