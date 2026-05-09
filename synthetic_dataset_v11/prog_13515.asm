; DESCRIPTION: Composite: . Then Places a blue line segment connecting (155, 116) to (140, 187). Then Renders a green disk with center (121, 91) and radius 70.
; PLAN: r0=155(x1), r1=116(y1), r2=140(x2), r3=187(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=121(x), r1=91(y), r2=70(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a blue line segment connecting (155, 116) to (140, 187).
; PLAN: r0=155(x1), r1=116(y1), r2=140(x2), r3=187(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 116
LDI r2, 140
LDI r3, 187
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a green disk with center (121, 91) and radius 70.
; PLAN: r0=121(x), r1=91(y), r2=70(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 91
LDI r2, 70
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
