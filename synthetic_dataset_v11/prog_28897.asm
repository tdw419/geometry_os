; DESCRIPTION: Composite: . Then Renders a purple line between points (134, 13) and (192, 202). Then Places a black dot at position (160, 247).
; PLAN: r0=134(x1), r1=13(y1), r2=192(x2), r3=202(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=160(x), r1=247(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a purple line between points (134, 13) and (192, 202).
; PLAN: r0=134(x1), r1=13(y1), r2=192(x2), r3=202(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 13
LDI r2, 192
LDI r3, 202
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a black dot at position (160, 247).
; PLAN: r0=160(x), r1=247(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 160
LDI r1, 247
LDI r2, 0x000000
PSET r0, r1, r2
HALT
