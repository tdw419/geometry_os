; DESCRIPTION: Composite: . Then Sets a single red pixel at (219, 217). Then Renders a yellow line between points (245, 193) and (141, 109).
; PLAN: r0=219(x), r1=217(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=245(x1), r1=193(y1), r2=141(x2), r3=109(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single red pixel at (219, 217).
; PLAN: r0=219(x), r1=217(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 219
LDI r1, 217
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Renders a yellow line between points (245, 193) and (141, 109).
; PLAN: r0=245(x1), r1=193(y1), r2=141(x2), r3=109(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 193
LDI r2, 141
LDI r3, 109
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
