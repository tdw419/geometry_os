; DESCRIPTION: Composite: . Then Renders a purple disk with center (111, 110) and radius 59. Then Renders a white line between points (3, 204) and (235, 107).
; PLAN: r0=111(x), r1=110(y), r2=59(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=3(x1), r1=204(y1), r2=235(x2), r3=107(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple disk with center (111, 110) and radius 59.
; PLAN: r0=111(x), r1=110(y), r2=59(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 110
LDI r2, 59
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a white line between points (3, 204) and (235, 107).
; PLAN: r0=3(x1), r1=204(y1), r2=235(x2), r3=107(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 204
LDI r2, 235
LDI r3, 107
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
