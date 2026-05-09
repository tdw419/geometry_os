; DESCRIPTION: Composite: . Then Renders a magenta line between points (176, 208) and (175, 142). Then Draws a blue circle centered at (114, 189) with radius 40.
; PLAN: r0=176(x1), r1=208(y1), r2=175(x2), r3=142(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=114(x), r1=189(y), r2=40(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a magenta line between points (176, 208) and (175, 142).
; PLAN: r0=176(x1), r1=208(y1), r2=175(x2), r3=142(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 208
LDI r2, 175
LDI r3, 142
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a blue circle centered at (114, 189) with radius 40.
; PLAN: r0=114(x), r1=189(y), r2=40(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 189
LDI r2, 40
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
