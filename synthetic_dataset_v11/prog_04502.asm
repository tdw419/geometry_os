; DESCRIPTION: Composite: . Then Draws a black line from (111, 107) to (233, 142). Then Creates a black circular shape at (115, 111) with radius 77.
; PLAN: r0=111(x1), r1=107(y1), r2=233(x2), r3=142(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=115(x), r1=111(y), r2=77(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a black line from (111, 107) to (233, 142).
; PLAN: r0=111(x1), r1=107(y1), r2=233(x2), r3=142(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 107
LDI r2, 233
LDI r3, 142
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a black circular shape at (115, 111) with radius 77.
; PLAN: r0=115(x), r1=111(y), r2=77(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 111
LDI r2, 77
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
