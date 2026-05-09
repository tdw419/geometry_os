; DESCRIPTION: Composite: . Then Sets a single orange pixel at (123, 241). Then Places a yellow line segment connecting (141, 254) to (2, 24).
; PLAN: r0=123(x), r1=241(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=141(x1), r1=254(y1), r2=2(x2), r3=24(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single orange pixel at (123, 241).
; PLAN: r0=123(x), r1=241(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 123
LDI r1, 241
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Places a yellow line segment connecting (141, 254) to (2, 24).
; PLAN: r0=141(x1), r1=254(y1), r2=2(x2), r3=24(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 254
LDI r2, 2
LDI r3, 24
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
