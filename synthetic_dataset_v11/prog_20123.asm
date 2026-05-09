; DESCRIPTION: Composite: . Then Places a purple line segment connecting (253, 159) to (124, 127). Then Places a magenta dot at position (140, 247).
; PLAN: r0=253(x1), r1=159(y1), r2=124(x2), r3=127(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=140(x), r1=247(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a purple line segment connecting (253, 159) to (124, 127).
; PLAN: r0=253(x1), r1=159(y1), r2=124(x2), r3=127(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 159
LDI r2, 124
LDI r3, 127
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta dot at position (140, 247).
; PLAN: r0=140(x), r1=247(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 140
LDI r1, 247
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
