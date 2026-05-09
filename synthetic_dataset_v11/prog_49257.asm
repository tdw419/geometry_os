; DESCRIPTION: Composite: . Then Renders a black disk with center (96, 224) and radius 21. Then Places a purple line segment connecting (112, 69) to (207, 164).
; PLAN: r0=96(x), r1=224(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=112(x1), r1=69(y1), r2=207(x2), r3=164(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black disk with center (96, 224) and radius 21.
; PLAN: r0=96(x), r1=224(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 224
LDI r2, 21
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a purple line segment connecting (112, 69) to (207, 164).
; PLAN: r0=112(x1), r1=69(y1), r2=207(x2), r3=164(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 69
LDI r2, 207
LDI r3, 164
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
