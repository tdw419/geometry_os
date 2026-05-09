; DESCRIPTION: Composite: . Then Renders a white disk with center (114, 200) and radius 16. Then Draws a magenta line from (250, 10) to (191, 99).
; PLAN: r0=114(x), r1=200(y), r2=16(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=250(x1), r1=10(y1), r2=191(x2), r3=99(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a white disk with center (114, 200) and radius 16.
; PLAN: r0=114(x), r1=200(y), r2=16(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 200
LDI r2, 16
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a magenta line from (250, 10) to (191, 99).
; PLAN: r0=250(x1), r1=10(y1), r2=191(x2), r3=99(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 10
LDI r2, 191
LDI r3, 99
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
