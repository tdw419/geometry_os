; DESCRIPTION: Composite: . Then Places a green circle of radius 37 at center (151, 179). Then Renders a cyan line between points (55, 51) and (100, 93).
; PLAN: r0=151(x), r1=179(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=55(x1), r1=51(y1), r2=100(x2), r3=93(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green circle of radius 37 at center (151, 179).
; PLAN: r0=151(x), r1=179(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 179
LDI r2, 37
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a cyan line between points (55, 51) and (100, 93).
; PLAN: r0=55(x1), r1=51(y1), r2=100(x2), r3=93(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 51
LDI r2, 100
LDI r3, 93
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
