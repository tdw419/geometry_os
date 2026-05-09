; DESCRIPTION: Composite: . Then Creates a blue circular shape at (71, 90) with radius 30. Then Places a white line segment connecting (188, 54) to (101, 134).
; PLAN: r0=71(x), r1=90(y), r2=30(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=188(x1), r1=54(y1), r2=101(x2), r3=134(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a blue circular shape at (71, 90) with radius 30.
; PLAN: r0=71(x), r1=90(y), r2=30(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 90
LDI r2, 30
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a white line segment connecting (188, 54) to (101, 134).
; PLAN: r0=188(x1), r1=54(y1), r2=101(x2), r3=134(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 54
LDI r2, 101
LDI r3, 134
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
