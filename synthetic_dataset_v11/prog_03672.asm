; DESCRIPTION: Composite: . Then Places a black line segment connecting (90, 80) to (71, 242). Then Sets a single orange pixel at (30, 165).
; PLAN: r0=90(x1), r1=80(y1), r2=71(x2), r3=242(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=30(x), r1=165(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a black line segment connecting (90, 80) to (71, 242).
; PLAN: r0=90(x1), r1=80(y1), r2=71(x2), r3=242(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 80
LDI r2, 71
LDI r3, 242
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single orange pixel at (30, 165).
; PLAN: r0=30(x), r1=165(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 30
LDI r1, 165
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
