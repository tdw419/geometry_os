; DESCRIPTION: Composite: . Then Places a green line segment connecting (171, 116) to (3, 163). Then Places a purple circle of radius 34 at center (61, 162).
; PLAN: r0=171(x1), r1=116(y1), r2=3(x2), r3=163(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=61(x), r1=162(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a green line segment connecting (171, 116) to (3, 163).
; PLAN: r0=171(x1), r1=116(y1), r2=3(x2), r3=163(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 116
LDI r2, 3
LDI r3, 163
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple circle of radius 34 at center (61, 162).
; PLAN: r0=61(x), r1=162(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 162
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
