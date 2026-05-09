; DESCRIPTION: Composite: . Then Renders a black line between points (144, 68) and (89, 99). Then Draws a blue rectangle at (184, 174) with width 27 and height 57.
; PLAN: r0=144(x1), r1=68(y1), r2=89(x2), r3=99(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=184(x), r1=174(y), r2=27(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black line between points (144, 68) and (89, 99).
; PLAN: r0=144(x1), r1=68(y1), r2=89(x2), r3=99(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 68
LDI r2, 89
LDI r3, 99
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a blue rectangle at (184, 174) with width 27 and height 57.
; PLAN: r0=184(x), r1=174(y), r2=27(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 174
LDI r2, 27
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
