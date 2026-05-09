; DESCRIPTION: Composite: . Then Renders a red disk with center (235, 135) and radius 16. Then Renders a white line between points (101, 90) and (218, 201).
; PLAN: r0=235(x), r1=135(y), r2=16(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=101(x1), r1=90(y1), r2=218(x2), r3=201(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a red disk with center (235, 135) and radius 16.
; PLAN: r0=235(x), r1=135(y), r2=16(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 235
LDI r1, 135
LDI r2, 16
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a white line between points (101, 90) and (218, 201).
; PLAN: r0=101(x1), r1=90(y1), r2=218(x2), r3=201(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 90
LDI r2, 218
LDI r3, 201
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
