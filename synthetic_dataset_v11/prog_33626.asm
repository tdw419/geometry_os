; DESCRIPTION: Composite: . Then Places a black dot at position (18, 100). Then Renders a purple line between points (128, 86) and (77, 102).
; PLAN: r0=18(x), r1=100(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=128(x1), r1=86(y1), r2=77(x2), r3=102(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black dot at position (18, 100).
; PLAN: r0=18(x), r1=100(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 18
LDI r1, 100
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Renders a purple line between points (128, 86) and (77, 102).
; PLAN: r0=128(x1), r1=86(y1), r2=77(x2), r3=102(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 86
LDI r2, 77
LDI r3, 102
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
