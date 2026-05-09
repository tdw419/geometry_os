; DESCRIPTION: Composite: . Then Places a magenta circle of radius 60 at center (92, 86). Then Renders a red line between points (156, 235) and (3, 148).
; PLAN: r0=92(x), r1=86(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=156(x1), r1=235(y1), r2=3(x2), r3=148(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta circle of radius 60 at center (92, 86).
; PLAN: r0=92(x), r1=86(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 92
LDI r1, 86
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a red line between points (156, 235) and (3, 148).
; PLAN: r0=156(x1), r1=235(y1), r2=3(x2), r3=148(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 235
LDI r2, 3
LDI r3, 148
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
