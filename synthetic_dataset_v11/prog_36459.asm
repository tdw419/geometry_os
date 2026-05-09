; DESCRIPTION: Composite: . Then Renders a black line between points (141, 48) and (194, 135). Then Creates a black circular shape at (117, 77) with radius 68.
; PLAN: r0=141(x1), r1=48(y1), r2=194(x2), r3=135(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=117(x), r1=77(y), r2=68(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a black line between points (141, 48) and (194, 135).
; PLAN: r0=141(x1), r1=48(y1), r2=194(x2), r3=135(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 48
LDI r2, 194
LDI r3, 135
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a black circular shape at (117, 77) with radius 68.
; PLAN: r0=117(x), r1=77(y), r2=68(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 77
LDI r2, 68
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
