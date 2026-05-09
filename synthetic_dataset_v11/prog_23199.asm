; DESCRIPTION: Composite: . Then Places a red line segment connecting (32, 218) to (71, 218). Then Sets a single purple pixel at (71, 152).
; PLAN: r0=32(x1), r1=218(y1), r2=71(x2), r3=218(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=71(x), r1=152(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a red line segment connecting (32, 218) to (71, 218).
; PLAN: r0=32(x1), r1=218(y1), r2=71(x2), r3=218(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 218
LDI r2, 71
LDI r3, 218
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single purple pixel at (71, 152).
; PLAN: r0=71(x), r1=152(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 71
LDI r1, 152
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
