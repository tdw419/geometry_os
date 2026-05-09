; DESCRIPTION: Composite: . Then Draws a green circle centered at (70, 97) with radius 66. Then Renders a orange line between points (13, 136) and (197, 182).
; PLAN: r0=70(x), r1=97(y), r2=66(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=13(x1), r1=136(y1), r2=197(x2), r3=182(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a green circle centered at (70, 97) with radius 66.
; PLAN: r0=70(x), r1=97(y), r2=66(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 97
LDI r2, 66
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a orange line between points (13, 136) and (197, 182).
; PLAN: r0=13(x1), r1=136(y1), r2=197(x2), r3=182(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 136
LDI r2, 197
LDI r3, 182
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
