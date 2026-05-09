; DESCRIPTION: Composite: . Then Renders a magenta line between points (249, 172) and (253, 122). Then Sets a single green pixel at (201, 181).
; PLAN: r0=249(x1), r1=172(y1), r2=253(x2), r3=122(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=201(x), r1=181(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a magenta line between points (249, 172) and (253, 122).
; PLAN: r0=249(x1), r1=172(y1), r2=253(x2), r3=122(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 172
LDI r2, 253
LDI r3, 122
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single green pixel at (201, 181).
; PLAN: r0=201(x), r1=181(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 201
LDI r1, 181
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
