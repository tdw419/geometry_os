; DESCRIPTION: Composite: . Then Places a purple circle of radius 68 at center (132, 169). Then Places a white dot at position (18, 37).
; PLAN: r0=132(x), r1=169(y), r2=68(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=18(x), r1=37(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a purple circle of radius 68 at center (132, 169).
; PLAN: r0=132(x), r1=169(y), r2=68(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 169
LDI r2, 68
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a white dot at position (18, 37).
; PLAN: r0=18(x), r1=37(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 18
LDI r1, 37
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
