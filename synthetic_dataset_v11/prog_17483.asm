; DESCRIPTION: Composite: . Then Places a blue line segment connecting (109, 209) to (41, 230). Then Places a green circle of radius 27 at center (152, 122).
; PLAN: r0=109(x1), r1=209(y1), r2=41(x2), r3=230(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=152(x), r1=122(y), r2=27(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a blue line segment connecting (109, 209) to (41, 230).
; PLAN: r0=109(x1), r1=209(y1), r2=41(x2), r3=230(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 209
LDI r2, 41
LDI r3, 230
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a green circle of radius 27 at center (152, 122).
; PLAN: r0=152(x), r1=122(y), r2=27(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 122
LDI r2, 27
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
