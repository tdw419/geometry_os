; DESCRIPTION: Composite: . Then Sets a single orange pixel at (133, 10). Then Places a red line segment connecting (48, 225) to (204, 64).
; PLAN: r0=133(x), r1=10(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r0=48(x1), r1=225(y1), r2=204(x2), r3=64(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single orange pixel at (133, 10).
; PLAN: r0=133(x), r1=10(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 133
LDI r1, 10
LDI r2, 0xFF8800
PSET r0, r1, r2
; DESCRIPTION: Places a red line segment connecting (48, 225) to (204, 64).
; PLAN: r0=48(x1), r1=225(y1), r2=204(x2), r3=64(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 225
LDI r2, 204
LDI r3, 64
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
