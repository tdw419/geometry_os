; DESCRIPTION: Composite: . Then Places a white circle of radius 43 at center (190, 68). Then Places a yellow line segment connecting (159, 191) to (134, 248).
; PLAN: r0=190(x), r1=68(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=159(x1), r1=191(y1), r2=134(x2), r3=248(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white circle of radius 43 at center (190, 68).
; PLAN: r0=190(x), r1=68(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 190
LDI r1, 68
LDI r2, 43
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a yellow line segment connecting (159, 191) to (134, 248).
; PLAN: r0=159(x1), r1=191(y1), r2=134(x2), r3=248(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 191
LDI r2, 134
LDI r3, 248
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
