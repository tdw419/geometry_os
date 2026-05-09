; DESCRIPTION: Composite: . Then Renders a yellow line between points (32, 145) and (216, 244). Then Places a purple dot at position (48, 32).
; PLAN: r0=32(x1), r1=145(y1), r2=216(x2), r3=244(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=48(x), r1=32(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a yellow line between points (32, 145) and (216, 244).
; PLAN: r0=32(x1), r1=145(y1), r2=216(x2), r3=244(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 145
LDI r2, 216
LDI r3, 244
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple dot at position (48, 32).
; PLAN: r0=48(x), r1=32(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 48
LDI r1, 32
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
