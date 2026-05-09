; DESCRIPTION: Composite: . Then Places a blue circle of radius 43 at center (136, 154). Then Places a blue line segment connecting (49, 226) to (147, 63).
; PLAN: r0=136(x), r1=154(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=49(x1), r1=226(y1), r2=147(x2), r3=63(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue circle of radius 43 at center (136, 154).
; PLAN: r0=136(x), r1=154(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 154
LDI r2, 43
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a blue line segment connecting (49, 226) to (147, 63).
; PLAN: r0=49(x1), r1=226(y1), r2=147(x2), r3=63(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 226
LDI r2, 147
LDI r3, 63
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
