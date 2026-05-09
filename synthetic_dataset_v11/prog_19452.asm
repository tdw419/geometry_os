; DESCRIPTION: Composite: . Then Sets a single blue pixel at (142, 180). Then Places a red line segment connecting (218, 248) to (39, 37).
; PLAN: r0=142(x), r1=180(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r0=218(x1), r1=248(y1), r2=39(x2), r3=37(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single blue pixel at (142, 180).
; PLAN: r0=142(x), r1=180(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 142
LDI r1, 180
LDI r2, 0x0000FF
PSET r0, r1, r2
; DESCRIPTION: Places a red line segment connecting (218, 248) to (39, 37).
; PLAN: r0=218(x1), r1=248(y1), r2=39(x2), r3=37(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 248
LDI r2, 39
LDI r3, 37
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
