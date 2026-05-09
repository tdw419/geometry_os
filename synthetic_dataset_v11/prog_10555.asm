; DESCRIPTION: Composite: . Then Renders a magenta line between points (4, 84) and (18, 29). Then Draws a purple rectangle at (78, 181) with width 117 and height 21.
; PLAN: r0=4(x1), r1=84(y1), r2=18(x2), r3=29(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=78(x), r1=181(y), r2=117(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a magenta line between points (4, 84) and (18, 29).
; PLAN: r0=4(x1), r1=84(y1), r2=18(x2), r3=29(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 84
LDI r2, 18
LDI r3, 29
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple rectangle at (78, 181) with width 117 and height 21.
; PLAN: r0=78(x), r1=181(y), r2=117(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 181
LDI r2, 117
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
