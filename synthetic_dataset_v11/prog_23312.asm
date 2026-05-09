; DESCRIPTION: Composite: . Then Places a purple line segment connecting (89, 152) to (3, 243). Then Places a red circle of radius 68 at center (80, 182).
; PLAN: r0=89(x1), r1=152(y1), r2=3(x2), r3=243(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=80(x), r1=182(y), r2=68(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a purple line segment connecting (89, 152) to (3, 243).
; PLAN: r0=89(x1), r1=152(y1), r2=3(x2), r3=243(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 152
LDI r2, 3
LDI r3, 243
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a red circle of radius 68 at center (80, 182).
; PLAN: r0=80(x), r1=182(y), r2=68(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 182
LDI r2, 68
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
