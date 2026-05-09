; DESCRIPTION: Composite: . Then Creates a black circular shape at (124, 107) with radius 72. Then Renders a purple line between points (28, 219) and (236, 150).
; PLAN: r0=124(x), r1=107(y), r2=72(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=28(x1), r1=219(y1), r2=236(x2), r3=150(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a black circular shape at (124, 107) with radius 72.
; PLAN: r0=124(x), r1=107(y), r2=72(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 107
LDI r2, 72
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a purple line between points (28, 219) and (236, 150).
; PLAN: r0=28(x1), r1=219(y1), r2=236(x2), r3=150(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 219
LDI r2, 236
LDI r3, 150
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
