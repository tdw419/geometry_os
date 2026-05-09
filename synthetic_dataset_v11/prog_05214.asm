; DESCRIPTION: Composite: . Then Places a blue dot at position (151, 22). Then Renders a red line between points (210, 7) and (77, 237).
; PLAN: r0=151(x), r1=22(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=210(x1), r1=7(y1), r2=77(x2), r3=237(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue dot at position (151, 22).
; PLAN: r0=151(x), r1=22(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 151
LDI r1, 22
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Renders a red line between points (210, 7) and (77, 237).
; PLAN: r0=210(x1), r1=7(y1), r2=77(x2), r3=237(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 7
LDI r2, 77
LDI r3, 237
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
