; DESCRIPTION: Composite: . Then Places a blue line segment connecting (231, 91) to (149, 196). Then Renders a black disk with center (73, 171) and radius 26.
; PLAN: r0=231(x1), r1=91(y1), r2=149(x2), r3=196(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=73(x), r1=171(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a blue line segment connecting (231, 91) to (149, 196).
; PLAN: r0=231(x1), r1=91(y1), r2=149(x2), r3=196(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 91
LDI r2, 149
LDI r3, 196
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a black disk with center (73, 171) and radius 26.
; PLAN: r0=73(x), r1=171(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 73
LDI r1, 171
LDI r2, 26
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
