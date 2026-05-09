; DESCRIPTION: Composite: . Then Renders a blue disk with center (133, 72) and radius 60. Then Renders a green line between points (237, 191) and (102, 33).
; PLAN: r0=133(x), r1=72(y), r2=60(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=237(x1), r1=191(y1), r2=102(x2), r3=33(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a blue disk with center (133, 72) and radius 60.
; PLAN: r0=133(x), r1=72(y), r2=60(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 72
LDI r2, 60
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a green line between points (237, 191) and (102, 33).
; PLAN: r0=237(x1), r1=191(y1), r2=102(x2), r3=33(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 191
LDI r2, 102
LDI r3, 33
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
