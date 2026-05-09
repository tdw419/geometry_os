; DESCRIPTION: Composite: . Then Renders a white line between points (132, 99) and (244, 28). Then Creates a black circular shape at (93, 179) with radius 20.
; PLAN: r0=132(x1), r1=99(y1), r2=244(x2), r3=28(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=93(x), r1=179(y), r2=20(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a white line between points (132, 99) and (244, 28).
; PLAN: r0=132(x1), r1=99(y1), r2=244(x2), r3=28(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 99
LDI r2, 244
LDI r3, 28
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a black circular shape at (93, 179) with radius 20.
; PLAN: r0=93(x), r1=179(y), r2=20(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 179
LDI r2, 20
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
