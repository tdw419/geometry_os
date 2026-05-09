; DESCRIPTION: Composite: . Then Places a purple dot at position (29, 245). Then Places a white line segment connecting (217, 163) to (125, 115).
; PLAN: r0=29(x), r1=245(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=217(x1), r1=163(y1), r2=125(x2), r3=115(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple dot at position (29, 245).
; PLAN: r0=29(x), r1=245(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 29
LDI r1, 245
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Places a white line segment connecting (217, 163) to (125, 115).
; PLAN: r0=217(x1), r1=163(y1), r2=125(x2), r3=115(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 163
LDI r2, 125
LDI r3, 115
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
