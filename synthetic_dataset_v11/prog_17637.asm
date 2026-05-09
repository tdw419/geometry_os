; DESCRIPTION: Composite: . Then Renders a black line between points (149, 201) and (213, 165). Then Sets a single red pixel at (150, 143).
; PLAN: r0=149(x1), r1=201(y1), r2=213(x2), r3=165(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=150(x), r1=143(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a black line between points (149, 201) and (213, 165).
; PLAN: r0=149(x1), r1=201(y1), r2=213(x2), r3=165(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 201
LDI r2, 213
LDI r3, 165
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single red pixel at (150, 143).
; PLAN: r0=150(x), r1=143(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 150
LDI r1, 143
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
